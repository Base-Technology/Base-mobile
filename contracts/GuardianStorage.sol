// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./interface/IGuardianStorage.sol";

contract GuardianStorage is IGuardianStorage {
    struct GuradianStrogeCofig{
        address [] guardians;
        mapping (address => GuardianInfo) guardiansInfo;
    }
    struct GuardianInfo{
        bool isGuardian;
        uint128 index;
    }
    mapping (address => GuradianStrogeCofig) internal configs;
    
    struct LockConfig{
        uint256 lock;
        address locker;
    }
    mapping (address => LockConfig) internal lockconfigs;

    function addGuardian(address _wallet, address _guardian) external {
        configs[_wallet].guardiansInfo[_guardian].isGuardian = true;
        configs[_wallet].guardians.push(_guardian);
        uint256 len = configs[_wallet].guardians.length;
        configs[_wallet].guardiansInfo[_guardian].index =uint128(len - 1);
    }

    function revokeGuardian(address _wallet, address _guardian) external {
        uint256 len = configs[_wallet].guardians.length;
        address lastGuardain = configs[_wallet].guardians[len - 1];
        if(_guardian != lastGuardain){
            uint128 index = configs[_wallet].guardiansInfo[_guardian].index;
            configs[_wallet].guardians[index] = lastGuardain;
            configs[_wallet].guardiansInfo[lastGuardain].index = index;
        }
        configs[_wallet].guardians.pop();
        delete configs[_wallet].guardiansInfo[_guardian];
    }

    function isGuardian(address _wallet, address _guardian)
        external
        view
        returns (bool)
    {
        return configs[_wallet].guardiansInfo[_guardian].isGuardian;
    }

    function getGuardians(address _wallet)
        external
        view
        returns (address[] memory)
    {
        return configs[_wallet].guardians;
    }

    function guardianCount(address _wallet) external view returns (uint256) {
        return configs[_wallet].guardians.length;
    }

    
    function isLocked(address _wallet) external view returns(bool){
        return lockconfigs[_wallet].lock > block.timestamp;
    }

    function getLock(address _wallet) external view returns(uint256){
        return lockconfigs[_wallet].lock;
    }

    function getLocker(address _wallet) external view returns (address){
        return lockconfigs[_wallet].locker;
    }

    function setLock (address _wallet, uint256 _releaseTime) external{
        lockconfigs[_wallet].lock = _releaseTime;
        lockconfigs[_wallet].locker = msg.sender;
    }
}
