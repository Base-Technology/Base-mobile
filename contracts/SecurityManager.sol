// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./BaseModule.sol";
import "./Utils.sol";

abstract contract SecurityManager is BaseModule {
    uint256 internal immutable securityPeriod;
    uint256 internal immutable securityWindow;
    uint256 internal immutable lockPeriod;
    uint256 internal immutable recoveryPeriod;

    constructor(uint256 _securityPeriod, uint256 _securityWindow, uint256 _lockPeriod, uint256 _recoveryPeriod) {
        require(_lockPeriod >= _recoveryPeriod,"Error:insecure lock period");
        require(_recoveryPeriod >= _securityPeriod + _securityWindow,"Error:insecure security period");
        securityPeriod = _securityPeriod;
        securityWindow = _securityWindow;
        lockPeriod = _lockPeriod;
        recoveryPeriod = _recoveryPeriod;
    }

    struct GuardianManagerConfig {
        mapping(bytes32 => uint256) pending;
    }
    mapping(address => GuardianManagerConfig) internal guardianConfigs;

    struct RecoveryConfig{
        address newOwner;
        uint64 executeTime;
        uint32 guardianCount;
    }
    mapping (address => RecoveryConfig) internal recoveryConfigs;

    modifier onlyOwnerOrSelf(address _wallet) {
        bool isSelf = (msg.sender == address(this));
        require(isOwner(_wallet,msg.sender) || isSelf, "Error:must be owner/self");
        _;
    }
    modifier onlyGuardianOrSelf(address _wallet){
        require(msg.sender == address(this) || isGuardian(_wallet, msg.sender),"Error:must be guardian/self");
        _;
    }
    modifier onlyWhenRecovery(address _wallet){
        require(recoveryConfigs[_wallet].executeTime > 0,"Error:is no recovery");
        _;
    }
    modifier WhenNotRecovery(address _wallet){
        require(recoveryConfigs[_wallet].executeTime == 0,"Error: is recovery");
        _;
    }

    function isOwner(address _wallet, address _owner) public view returns(bool) {
        return IWallet(_wallet).isOwner(_owner);
    }
    function isGuardian(address _wallet, address _guardian) public view returns (bool) {
        return guardianStorage.isGuardian(_wallet, _guardian);
    }

    function guardianCount(address _wallet) public view returns (uint256) {
        return guardianStorage.guardianCount(_wallet);
    }

    function getGuardians(address _wallet) external view returns (address[] memory) {
        return guardianStorage.getGuardians(_wallet);
    }

    function addGuardian(address _wallet, address _guardian) external onlyOwnerOrSelf(_wallet){
    // function addGuardian(address _wallet, address _guardian) external {
        require(
            !IWallet(_wallet).isOwner(_guardian),
            "Error: owner can not be a guardian"
        );
        require(!isGuardian(_wallet, _guardian), "Error:is already a guardian");

        (bool success, ) = _guardian.call{gas: 25000}(
            abi.encodeWithSignature("owner()")
        );
        require(success, "Error:must be EOA/ wallet");

        bytes32 id = keccak256(
            abi.encodePacked(_wallet, _guardian, "addition")
        );
        require(
            guardianConfigs[_wallet].pending[id] == 0 ||
                block.timestamp >
                guardianConfigs[_wallet].pending[id] + securityWindow,
            "Error:duplicate pending addition"
        );
        // uint256 count = guardianCount(_wallet);
        // if (guardianCount(_wallet) == 0) {
        //     guardianConfigs[_wallet].pending[id] = block.timestamp;
        // } else {
        guardianConfigs[_wallet].pending[id] = block.timestamp + securityPeriod;
        // }
    }
    function confirmGuardianAddition(address _wallet, address _guardian) external {
        bytes32 id = keccak256(
            abi.encodePacked(_wallet, _guardian, "addition")
        );
        require(
            guardianConfigs[_wallet].pending[id] > 0,
            "Error: no pending addition"
        );
        require(
            guardianConfigs[_wallet].pending[id] < block.timestamp,
            "Error: pending addition not over"
        );
        require(
            block.timestamp <
                guardianConfigs[_wallet].pending[id] + securityWindow,
            "Error: pending addition expired"
        );
        guardianStorage.addGuardian(_wallet, _guardian);
        delete guardianConfigs[_wallet].pending[id];
    }
    function cancelGuardianAddition(address _wallet, address _guardian) external onlyOwnerOrSelf(_wallet){
        bytes32 id = keccak256(
            abi.encodePacked(_wallet, _guardian, "addition")
        );
        require(
            guardianConfigs[_wallet].pending[id] > 0,
            "Error:no pending addition"
        );
        delete guardianConfigs[_wallet].pending[id];
    }

    function revokeGuardian(address _wallet, address _guardian) external onlyOwnerOrSelf(_wallet){
        require(isGuardian(_wallet, _guardian), "Error:is not a guardian");
        bytes32 id = keccak256(abi.encodePacked(_wallet, _guardian, "revokation"));
        require(guardianConfigs[_wallet].pending[id] == 0 || block.timestamp > guardianConfigs[_wallet].pending[id] + securityWindow,"Error:duplicate pending revoketion");
        guardianConfigs[_wallet].pending[id] = block.timestamp + securityPeriod;
    }
    function confirmGuardianRevokation(address _wallet, address _guardian) external {
        bytes32 id = keccak256(abi.encodePacked(_wallet, _guardian, "revokation"));
        require(guardianConfigs[_wallet].pending[id] > 0, "Error: no pending revokation");
        require(guardianConfigs[_wallet].pending[id] < block.timestamp, "Error: pending revokation not over");
        require(block.timestamp < guardianConfigs[_wallet].pending[id] + securityWindow, "Error:pending revokation expired");
        guardianStorage.revokeGuardian(_wallet, _guardian);
        delete guardianConfigs[_wallet].pending[id];
    }
    function cancelGuardianRevokation(address _wallet, address _guardian) external onlyOwnerOrSelf(_wallet){
        bytes32 id = keccak256(abi.encodePacked(_wallet, _guardian, "revokation"));
        require(guardianConfigs[_wallet].pending[id] > 0, "Error: no pending revokation");
        delete guardianConfigs[_wallet].pending[id];
    }

    function setLock(address _wallet, uint256 _releaseTime, bytes4 _locker) internal {
        locks[_wallet].release = uint64(_releaseTime);
        locks[_wallet].locker = _locker;
    }
    function lock(address _wallet) external onlyGuardianOrSelf(_wallet) onlyWhenUnlock(_wallet){
        setLock(_wallet, block.timestamp + lockPeriod, SecurityManager.lock.selector);
    }
    function unlock(address _wallet) external onlyGuardianOrSelf(_wallet) onlyWhenLock(_wallet){
        require(locks[_wallet].locker == SecurityManager.lock.selector,"Error: is not locker can not unlock");
        setLock(_wallet, 0, bytes4(0));
    }
    function getLock(address _wallet) external view returns(uint64){
        return _isLocked(_wallet)? locks[_wallet].release : 0;
    }
    function isLocked(address _wallet) external view returns(bool){
        return _isLocked(_wallet);
    }
    
    function executeRecovery(address _wallet, address _newOwner) external onlySelf() WhenNotRecovery(_wallet){
        require(_newOwner != address(0),"Error:newOwner can not be address(0)");
        require(!isOwner(_wallet,_newOwner),"Error:newOwner is already a owner");
        require(!isGuardian(_wallet,_newOwner),"Error:newOwner can not be a guardian");
        recoveryConfigs[_wallet].newOwner = _newOwner;
        recoveryConfigs[_wallet].executeTime = uint64(block.timestamp + recoveryPeriod);
        recoveryConfigs[_wallet].guardianCount = uint32(guardianCount(_wallet));
        setLock(_wallet, block.timestamp + lockPeriod, SecurityManager.executeRecovery.selector);
    }
    function finalizeRecovery(address _wallet) external onlyWhenRecovery(_wallet){
        require(recoveryConfigs[_wallet].executeTime < uint64(block.timestamp),"Error:recovery period not end");
        IWallet(_wallet).setOwnerAfterRecovery(recoveryConfigs[_wallet].newOwner);
        delete recoveryConfigs[_wallet];
        setLock(_wallet, 0, bytes4(0));
    }
    function cancelRecovery(address _wallet) external onlySelf() onlyWhenRecovery(_wallet){
        delete recoveryConfigs[_wallet];
        setLock(_wallet, 0, bytes4(0));
    }
    function getRecovery(address _wallet) external view returns(address _newOwner, uint64 _executeTime, uint32 _guardianCount){
        return(recoveryConfigs[_wallet].newOwner, recoveryConfigs[_wallet].executeTime, recoveryConfigs[_wallet].guardianCount);
    }

    // simple recovery
    // function executeRecovery_v2(address[] memory _executor, address _wallet, address _newOwner) external onlySelf() WhenNotRecovery(_wallet){
    function executeRecovery_v2(address[] memory _executor, address _wallet, address _newOwner) external WhenNotRecovery(_wallet){
        uint count = guardianCount(_wallet);
        require(count > 0, "wallet must have at least 1 guardian to recovery");
        require(_newOwner != address(0),"Error:newOwner can not be address(0)");
        require(!isOwner(_wallet,_newOwner),"Error:newOwner is already a owner");
        require(!isGuardian(_wallet,_newOwner),"Error:newOwner can not be a guardian");
        uint len = _executor.length;
        for (uint i = 0; i < len; i++){
            require(isGuardian(_wallet,_executor[i]),"one of the executors is not guardian");
        }
        require(Utils.ceil(count, 2) <= len,"not enough executor");
        recoveryConfigs[_wallet].newOwner = _newOwner;
        recoveryConfigs[_wallet].executeTime = uint64(block.timestamp + recoveryPeriod);
        recoveryConfigs[_wallet].guardianCount = uint32(guardianCount(_wallet));
        setLock(_wallet, block.timestamp + lockPeriod, SecurityManager.executeRecovery.selector);
    }
    // function cancelRecovery_v2(address[] memory _executor,address _wallet) external onlySelf() onlyWhenRecovery(_wallet){
    function cancelRecovery_v2(address[] memory _executor,address _wallet) external onlyWhenRecovery(_wallet){
        uint len = _executor.length;
        for (uint i = 0; i < len; i++){
            if(IWallet(_wallet).isOwner(_executor[i])){
                continue;
            }
            require(isGuardian(_wallet,_executor[i]),"one of the executors is not guardian/owner");
        }
        uint count = guardianCount(_wallet);
        require(Utils.ceil(count+1, 2) <= len,"not enough executor");
        delete recoveryConfigs[_wallet];
        setLock(_wallet, 0, bytes4(0));
    }
}
