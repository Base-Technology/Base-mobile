// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.3;

import "./interface/IModule.sol";
import "./interface/IGuardianStorage.sol";
import "./interface/ITransferStorage.sol";
import "./interface/IAuthoriser.sol";
import "./interface/IWallet.sol";
import "./interface/IModuleRegistry.sol";
import "./lib/ERC20.sol";

abstract contract BaseModule is IModule {
    address constant internal ETH_TOKEN = address(0);
    bytes constant internal EMPTY_BYTES = "";

    IGuardianStorage internal immutable guardianStorage;
    ITransferStorage internal immutable userWhitelist;
    IAuthoriser internal immutable authoriser;
    IModuleRegistry internal immutable registry;
    constructor(
        IModuleRegistry _registry,
        IGuardianStorage _guardianStorage,
        ITransferStorage _userWhitelist,
        IAuthoriser _authoriser
    ){
        registry = _registry;
        guardianStorage = _guardianStorage;
        userWhitelist = _userWhitelist;
        authoriser = _authoriser;
    }

    struct Lock{
        uint64 release;
        bytes4 locker;
    }
    mapping (address => Lock) internal locks;

    enum OwnerSignature{
        Anyone,
        Required,
        Optional,
        Disallowed,
        Session
    }

    struct Session{
        address key;
        uint64 expires;
    }
    mapping (address => Session) internal sessions;

    modifier onlyWhenLock(address _wallet){
        require(_isLocked(_wallet),"Error:wallet is unlock");
        _;
    }
    modifier onlyWhenUnlock(address _wallet){
        require(!_isLocked(_wallet),"Error:wallet is lock");
        _;
    }
    modifier onlySelf(){
        require(msg.sender == address(this),"Error:must be self");
        _;
    }
    modifier onlyWalletOwnerOrSelf(address _wallet) {
        require(msg.sender == address(this) || IWallet(_wallet).isOwner(msg.sender), "must be wallet owner/self");
        _;
    }


    function _isLocked(address _wallet) internal view returns(bool){
        return locks[_wallet].release > uint64(block.timestamp);
    }

    function invokeWallet(address _wallet, address _to, uint256 _value, bytes memory _data) internal returns (bytes memory _res) {
        bool success;
        (success, _res) = _wallet.call(abi.encodeWithSignature("invoke(address,uint256,bytes)", _to, _value, _data));
        if (success && _res.length > 0) { 
            (_res) = abi.decode(_res, (bytes));
        } else if (_res.length > 0) {
            assembly {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        } else if (!success) {
            revert("BM: wallet invoke reverted");
        }
    }
}