// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// 此为简化版Factory 部分设置不完全
import "./BaseWallet.sol";
import "./Proxy.sol";
import "./Utils.sol";
import "./Managed.sol";

contract Factory is Managed {
    address internal constant ETH_TOKEN = address(0);

    address public immutable walletImplementation;
    address public immutable guardianStorage;

    address public refundAddress;

    // *****EVENTS***** //
    event RefundAddressChanged(address addr);

    // indexed 修饰符 将参数作为topic存储
    event WalletCreated(
        address indexed wallet,
        address indexed owner,
        address refundToken,
        uint256 refundAmount
    );

    // ***EVENTS END*** //

    constructor(
        address _walletImplementation,
        address _guardianStorage,
        address _refundAddress
    ) public {
        require(
            _walletImplementation != address(0),
            "WF: empty wallet implementation"
        );
        require(_guardianStorage != address(0), "WF: empty guardian storage");
        require(_refundAddress != address(0), "WF: empty refund address");
        walletImplementation = _walletImplementation;
        guardianStorage = _guardianStorage;
        refundAddress = _refundAddress;
    }

    function revokeManager(address) external pure override {
        revert("WF: Manager can not REVOKE in WF");
    }

    function validateInputs(address _owner, address[] calldata _modules)
        internal
        pure
    {
        require(_owner != address(0), "WF: empty owner address");
        require(_modules.length > 0, "WF: empty modules");
    }

    function createCounterfactualWallet(
        address _owner,
        address[] calldata _modules,
        bytes20 _salt,
        uint256 _refundAmount,
        address _refundToken,
        bytes calldata _ownerSignature,
        bytes calldata _managerSignature
    ) external returns (address _wallet) {
        validateInputs(_owner, _modules);
        bytes32 newsalt = newSalt(_salt, _owner, _modules);
        address payable wallet = payable(
            new Proxy{salt: newsalt}(walletImplementation)
        );
        validateAuthorisedCreation(wallet, _managerSignature);
        if (_modules.length == 1) {
            require(_modules[0] != address(0), "empty modules");
        }
        configureWallet(BaseWallet(wallet), _owner, _modules);

        if (_refundAmount > 0 && _ownerSignature.length == 65) {
            // require(_refundAmount < 0, "123");
            validateAndRefund(
                wallet,
                _owner,
                _refundAmount,
                _refundToken,
                _ownerSignature
            );
        }
        // remove the factory from the authorised modules
        BaseWallet(wallet).authoriseModule(address(this), false);

        // emit event
        emit WalletCreated(wallet, _owner, _refundToken, _refundAmount);

        return wallet;
    }

    // Gets the address of a counterfactual wallet with a first default guardian.
    function getAddressForCounterfactualWallet(
        address _owner,
        address[] calldata _modules,
        bytes20 _salt
    ) external view returns (address _wallet) {
        validateInputs(_owner, _modules);
        // 几次加密？？
        bytes32 newsalt = newSalt(_salt, _owner, _modules);
        bytes memory code = abi.encodePacked(
            type(Proxy).creationCode,
            uint256(uint160(walletImplementation))
        );
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                newsalt,
                keccak256(code)
            )
        );
        _wallet = address(uint160(uint256(hash)));
    }

    function changeRefundAddress(address _refundAddress) external onlyOwner {
        require(_refundAddress != address(0), "WF: cannot set to empty");
        refundAddress = _refundAddress;
        emit RefundAddressChanged(_refundAddress);
    }

    function init(BaseWallet _wallet) external pure {
        // do nothing
    }

    function configureWallet(
        BaseWallet _wallet,
        address _owner,
        address[] calldata _modules
    ) internal {
        // add the factory to modules so it can add the first guardian and trigger the refund
        address[] memory extendedModules = new address[](_modules.length + 1);
        extendedModules[0] = address(this);
        for (uint i = 0; i < _modules.length; i++) {
            extendedModules[i + 1] = _modules[i];
        }
        // initialise the wallet with the owner and the extended modules
        _wallet.init(_owner, extendedModules);
    }

    function newSalt(
        bytes20 _salt,
        address _owner,
        address[] calldata _modules
    ) internal pure returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    keccak256(abi.encodePacked(_owner, _modules)),
                    _salt
                )
            );
    }

    function validateAuthorisedCreation(
        address _wallet,
        bytes memory _managerSignature
    ) internal view {
        address manager;
        if (_managerSignature.length != 65) {
            manager = msg.sender;
        } else {
            bytes32 signedHash = keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    bytes32(uint256(uint160(_wallet)))
                )
            );
            manager = Utils.recoverSigner(signedHash, _managerSignature, 0);
        }
        require(managers[manager], "WF: unauthorised wallet creation"); // 问题 2
    }

    function validateAndRefund(
        address _wallet,
        address _owner,
        uint256 _refundAmount,
        address _refundToken,
        bytes memory _ownerSignature
    ) internal {
        bytes32 signedHash = keccak256(
            abi.encodePacked(
                "\x19Ethereum Signed Message:\n32",
                keccak256(
                    abi.encodePacked(_wallet, _refundAmount, _refundToken)
                )
            )
        );
        address signer = Utils.recoverSigner(signedHash, _ownerSignature, 0);
        if (signer == _owner) {
            if (_refundToken == ETH_TOKEN) {
                // require(_refundAmount < 0, "123");
                invokeWallet(_wallet, refundAddress, _refundAmount, "");
            } else {
                bytes memory methodData = abi.encodeWithSignature(
                    "transfer(address,uint256)",
                    refundAddress,
                    _refundAmount
                );
                bytes memory transferSuccessBytes = invokeWallet(
                    _wallet,
                    _refundToken,
                    0,
                    methodData
                );
                if (transferSuccessBytes.length > 0) {
                    require(
                        abi.decode(transferSuccessBytes, (bool)),
                        "WF: Refund transfer failed"
                    );
                }
            }
        }
    }

    function invokeWallet(
        address _wallet,
        address _to,
        uint256 _value,
        bytes memory _data
    ) internal returns (bytes memory _res) {
        bool success;
        (success, _res) = _wallet.call(
            abi.encodeWithSignature(
                "invoke(address,uint256,bytes)",
                _to,
                _value,
                _data
            )
        );
        if (success) {
            (_res) = abi.decode(_res, (bytes));
        } else {
            // solhint-disable-next-line no-inline-assembly
            assembly {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        }
    }
}
