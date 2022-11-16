// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./BaseModule.sol";
import "./Utils.sol";

abstract contract TransactionManager is BaseModule {
    // Static calls
    bytes4 private constant ERC1271_IS_VALID_SIGNATURE =
        bytes4(keccak256("isValidSignature(bytes32,bytes)"));
    bytes4 private constant ERC721_RECEIVED =
        bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    bytes4 private constant ERC1155_RECEIVED =
        bytes4(
            keccak256(
                "onERC1155Received(address,address,uint256,uint256,bytes)"
            )
        );
    bytes4 private constant ERC1155_BATCH_RECEIVED =
        bytes4(
            keccak256(
                "onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"
            )
        );
    bytes4 private constant ERC165_INTERFACE =
        bytes4(keccak256("supportsInterface(bytes4)"));

    struct Call {
        address to;
        uint256 value;
        bytes data;
    }

    event AddedToWhitelist(
        address indexed wallet,
        address indexed target,
        uint64 whitelistAfter
    );
    
    uint256 internal immutable whitelistPeriod;

    constructor(uint256 _whitelistPeriod) {
        whitelistPeriod = _whitelistPeriod;
    }

    function supportsStaticCall(bytes4 _methodId)
        external
        pure
        override
        returns (bool _isSupported)
    {
        return
            _methodId == ERC1271_IS_VALID_SIGNATURE ||
            _methodId == ERC721_RECEIVED ||
            _methodId == ERC165_INTERFACE ||
            _methodId == ERC1155_RECEIVED ||
            _methodId == ERC1155_BATCH_RECEIVED;
    }

    function isValidSignature(bytes32 _msgHash, bytes memory _signature)
        external
        view
        returns (bytes4)
    {
        require(_signature.length == 65, "TM: invalid signature length");
        address signer = Utils.recoverSigner(_msgHash, _signature, 0);
        require(IWallet(msg.sender).isOwner(signer), "TM: Invalid signer");
        return ERC1271_IS_VALID_SIGNATURE;
    }

    function supportsInterface(bytes4 _interfaceID)
        external
        pure
        returns (bool)
    {
        return
            _interfaceID == ERC165_INTERFACE ||
            _interfaceID == (ERC1155_RECEIVED ^ ERC1155_BATCH_RECEIVED);
    }

    function multiCall(address _wallet, Call[] calldata _transactions)
        external
        // onlySelf
        onlyWhenUnlock(_wallet)
        returns (bytes[] memory)
    {
        bytes[] memory results = new bytes[](_transactions.length);
        for (uint256 i = 0; i < _transactions.length; i++) {
            address spender = Utils.recoverSpender(
                _transactions[i].to,
                _transactions[i].data
            );
            require(
                (_transactions[i].value == 0 ||
                    spender == _transactions[i].to) &&
                    (isWhitelisted(_wallet, spender) ||
                        authoriser.isAuthorised(
                            _wallet,
                            spender,
                            _transactions[i].to,
                            _transactions[i].data
                        )),
                "call not authorised"
            );
            results[i] = invokeWallet(
                _wallet,
                _transactions[i].to,
                _transactions[i].value,
                _transactions[i].data
            );
        }
        return results;
    }

    function addToWhitelist(address _wallet, address _target)
        external
        onlyWalletOwnerOrSelf(_wallet)
        onlyWhenUnlock(_wallet)
    {
        require(_target != _wallet, "TM: Cannot whitelist wallet");
        require(
            !registry.isRegisteredModule(_target),
            "TM: Cannot whitelist module"
        );
        require(
            !isWhitelisted(_wallet, _target),
            "TM: target already whitelisted"
        );

        uint256 whitelistAfter = block.timestamp + whitelistPeriod;
        setWhitelist(_wallet, _target, whitelistAfter);
        emit AddedToWhitelist(_wallet, _target, uint64(whitelistAfter));
    }

    function isWhitelisted(address _wallet, address _target)
        public
        view
        returns (bool _isWhitelisted)
    {
        uint256 whitelistAfter = userWhitelist.getWhitelist(_wallet, _target);
        return whitelistAfter > 0 && whitelistAfter < block.timestamp;
    }

    function setWhitelist(
        address _wallet,
        address _target,
        uint256 _whitelistAfter
    ) internal {
        userWhitelist.setWhitelist(_wallet, _target, _whitelistAfter);
    }
}
