// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Owned.sol";
import "./lib/ERC20.sol";

contract ModuleRegistry is Owned{
    struct Info{
        bool exists;
        bytes32 name;
    }
    mapping (address => Info) internal modules;
    mapping (address => Info) internal upgraders;

    event ModuleRegistered(address indexed module, bytes32 name);
    event ModuleDeRegistered(address module);
    event UpgraderRegistered(address upgrader, bytes32 name);
    event UpgraderDeRegistered(address upgrader);

    function registerModule(address _module, bytes32 _name) external onlyOwner {
        require(!modules[_module].exists, "MR: module already exists");
        modules[_module] = Info({exists: true, name: _name});
        emit ModuleRegistered(_module, _name);
    }
    function deregisterModule(address _module) external onlyOwner {
        require(modules[_module].exists, "MR: module does not exist");
        delete modules[_module];
        emit ModuleDeRegistered(_module);
    }
    function registerUpgrader(address _upgrader, bytes32 _name) external onlyOwner {
        require(!upgraders[_upgrader].exists, "MR: upgrader already exists");
        upgraders[_upgrader] = Info({exists: true, name: _name});
        emit UpgraderRegistered(_upgrader, _name);
    }
    function deregisterUpgrader(address _upgrader) external onlyOwner {
        require(upgraders[_upgrader].exists, "MR: upgrader does not exist");
        delete upgraders[_upgrader];
        emit UpgraderDeRegistered(_upgrader);
    }
    function recoverToken(address _token) external onlyOwner {
        uint total = ERC20(_token).balanceOf(address(this));
        ERC20(_token).transfer(msg.sender, total);
    }
    function moduleInfo(address _module) external view returns (bytes32) {
        return modules[_module].name;
    }
    function upgraderInfo(address _upgrader) external view returns (bytes32) {
        return upgraders[_upgrader].name;
    }
    function isRegisteredModule(address _module) external view returns (bool) {
        return modules[_module].exists;
    }
    function isRegisteredModule(address[] calldata _modules) external view returns (bool) {
        for (uint i = 0; i < _modules.length; i++) {
            if (!modules[_modules[i]].exists) {
                return false;
            }
        }
        return true;
    }
    function isRegisteredUpgrader(address _upgrader) external view returns (bool) {
        return upgraders[_upgrader].exists;
    }
}