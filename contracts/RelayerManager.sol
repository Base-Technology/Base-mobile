// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/math/Math.sol";
import "./BaseModule.sol";
import "./Utils.sol";
import "./SimpleOracle.sol";
import "./lib/ERC20.sol";

// abstract contract RelayerManager is BaseModule {
abstract contract RelayerManager is BaseModule, SimpleOracle {
    uint256 internal constant BLOCKBOUND = 10000;

    struct StackExtension {
        uint256 requiredSignatures;
        OwnerSignature ownerSignatureRequirement;
        bytes32 signHash;
        bool success;
        bytes returnData;
    }
    struct RelayerConfig {
        uint256 nonce;
        mapping(bytes32 => bool) executedTx;
    }
    mapping(address => RelayerConfig) internal relayer;

    event TransactionExecuted(
        address indexed wallet,
        bool indexed success,
        bytes returnData,
        bytes32 signedHash
    );
    event Refund(
        address indexed wallet,
        address indexed refundAddress,
        address refundToken,
        uint256 refundAmount
    );

    // constructor(address _uniswapRouter) {}
    constructor(address _uniswapRouter) SimpleOracle(_uniswapRouter) {}

    function getRequiredSignatures(address _wallet, bytes calldata _data)
        public
        view
        virtual
        returns (uint256, OwnerSignature);

    function execute(
        address _wallet,
        bytes calldata _data,
        uint256 _nonce,
        bytes calldata _signatures,
        uint256 _gasPrice,
        uint256 _gasLimit,
        address _refundToken,
        address _refundAddress
    ) external returns (bool) {
        uint256 startGas = gasleft() + 21000 + msg.data.length * 8;
        require(startGas >= _gasLimit, "Error: not enough gas provided");
        require(
            verifyData(_wallet, _data),
            "Error: Target of _data != _wallet"
        );
        require(
            !_isLocked(_wallet) || _gasPrice == 0,
            "Error: Locked wallet refund"
        );
        StackExtension memory stack;
        (
            stack.requiredSignatures,
            stack.ownerSignatureRequirement
        ) = getRequiredSignatures(_wallet, _data);
        require(
            stack.requiredSignatures > 0 ||
                stack.ownerSignatureRequirement == OwnerSignature.Anyone,
            " Wrong signature requirement"
        );
        require(
            stack.requiredSignatures * 65 == _signatures.length,
            "Wrong number of signatures"
        );

        stack.signHash = getSignHash(
            address(this),
            0,
            _data,
            _nonce,
            _gasPrice,
            _gasLimit,
            _refundToken,
            _refundAddress
        );
        require(
            checkAndUpdateUniqueness(
                _wallet,
                _nonce,
                stack.signHash,
                stack.requiredSignatures,
                stack.ownerSignatureRequirement
            ),
            "Error:Duplicate request"
        );
        if (stack.ownerSignatureRequirement == OwnerSignature.Session) {
            require(
                validateSession(_wallet, stack.signHash, _signatures),
                "Error: Invalid session"
            );
        } else {
            require(
                validateSignatures(
                    _wallet,
                    stack.signHash,
                    _signatures,
                    stack.ownerSignatureRequirement
                ),
                "Error:Invalid signatures"
            );
        }
        (stack.success, stack.returnData) = address(this).call(_data);
        refund(
            _wallet,
            startGas,
            _gasPrice,
            _gasLimit,
            _refundToken,
            _refundAddress,
            stack.requiredSignatures,
            stack.ownerSignatureRequirement
        );
        emit TransactionExecuted(
            _wallet,
            stack.success,
            stack.returnData,
            stack.signHash
        );
        return stack.success;
    }

    function verifyData(address _wallet, bytes calldata _data)
        internal
        pure
        returns (bool)
    {
        require(_data.length >= 36, "Error:Invalid dataWallet");
        address dataWallet = abi.decode(_data[4:], (address));
        return dataWallet == _wallet;
    }

    function getSignHash(
        address _from,
        uint256 _value,
        bytes memory _data,
        uint256 _nonce,
        uint256 _gasPrice,
        uint256 _gasLimit,
        address _refundToken,
        address _refundAddress
    ) internal view returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    keccak256(
                        abi.encodePacked(
                            bytes1(0x19),
                            bytes1(0),
                            _from,
                            _value,
                            _data,
                            uint256(1337),
                            _nonce,
                            _gasPrice,
                            _gasLimit,
                            _refundToken,
                            _refundAddress
                        )
                    )
                )
            );
    }

    function checkAndUpdateUniqueness(
        address _wallet,
        uint256 _nonce,
        bytes32 _signHash,
        uint256 _requiredSignatures,
        OwnerSignature _ownerSignatureRequirement
    ) internal returns (bool) {
        if (
            _requiredSignatures == 1 &&
            (_ownerSignatureRequirement == OwnerSignature.Required ||
                _ownerSignatureRequirement == OwnerSignature.Session)
        ) {
            if (_nonce <= relayer[_wallet].nonce) {
                return false;
            }
            uint256 nonceBlock = (_nonce &
                0xffffffffffffffffffffffffffffffff00000000000000000000000000000000) >>
                128;
            if (nonceBlock > block.number + BLOCKBOUND) {
                return false;
            }
            relayer[_wallet].nonce = _nonce;
            return true;
        } else {
            if (relayer[_wallet].executedTx[_signHash] == true) {
                return false;
            }
            relayer[_wallet].executedTx[_signHash] = true;
            return true;
        }
    }

    function validateSession(
        address _wallet,
        bytes32 _signHash,
        bytes calldata _signatures
    ) internal view returns (bool) {
        address signer = Utils.recoverSigner(_signHash, _signatures, 0);
        return (signer == sessions[_wallet].key &&
            sessions[_wallet].expires >= block.timestamp);
    }

    function validateSignatures(
        address _wallet,
        bytes32 _signHash,
        bytes memory _signatures,
        OwnerSignature _option
    ) internal view returns (bool) {
        if (_signatures.length == 0) {
            return true;
        }

        address lastSigner = address(0);
        address[] memory guardians;

        if (_option != OwnerSignature.Required || _signatures.length > 65) {
            guardians = guardianStorage.getGuardians(_wallet);
        }

        bool isGuardian;

        for (uint256 i = 0; i < _signatures.length / 65; i++) {
            address signer = Utils.recoverSigner(_signHash, _signatures, i);

            if (i == 0) {
                if (_option == OwnerSignature.Required) {
                    if (IWallet(_wallet).isOwner(signer)) {
                        continue;
                    }
                    return false;
                } else if (_option == OwnerSignature.Optional) {
                    if (IWallet(_wallet).isOwner(signer)) {
                        continue;
                    }
                }
            }
            if (signer <= lastSigner) {
                return false;
            }
            lastSigner = signer;
            (isGuardian, guardians) = Utils.isGuardianOrGuardianSigner(
                guardians,
                signer
            );
            if (!isGuardian) {
                return false;
            }
        }
        return true;
    }

    function refund(
        address _wallet,
        uint _startGas,
        uint _gasPrice,
        uint _gasLimit,
        address _refundToken,
        address _refundAddress,
        uint256 _requiredSignatures,
        OwnerSignature _option
    ) internal {
        if (
            _gasPrice > 0 &&
            (_option == OwnerSignature.Required ||
                _option == OwnerSignature.Session)
        ) {
            address refundAddress = _refundAddress == address(0) ? msg.sender : _refundAddress;
            if (_requiredSignatures == 1 && _option == OwnerSignature.Required) {
                if (!authoriser.isAuthorised(_wallet, refundAddress, address(0), EMPTY_BYTES)) {
                    uint whitelistAfter = userWhitelist.getWhitelist(_wallet, refundAddress);
                    require(
                        whitelistAfter > 0 && whitelistAfter < block.timestamp,
                        "Error:refund not authorised"
                    );
                }
            }
            uint256 refundAmount;
            if (_refundToken == ETH_TOKEN) {
                uint256 gasConsumed = _startGas - gasleft() + 23000;
                refundAmount =
                    Math.min(gasConsumed, _gasLimit) *
                    Math.min(_gasPrice, tx.gasprice);
                invokeWallet(_wallet, refundAddress, refundAmount, EMPTY_BYTES);
            } else {
                uint256 gasConsumed = _startGas - gasleft() + 37500;
                uint256 tokenGasPrice = inToken(_refundToken, tx.gasprice);
                refundAmount =
                    Math.min(gasConsumed, _gasLimit) *
                    Math.min(_gasPrice, tokenGasPrice);
                bytes memory methodData = abi.encodeWithSelector(
                    ERC20.transfer.selector,
                    refundAddress,
                    refundAmount
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
                        "Error: Refund transfer failed"
                    );
                }
            }
            emit Refund(_wallet, refundAddress, _refundToken, refundAmount);
        }
    }
}
