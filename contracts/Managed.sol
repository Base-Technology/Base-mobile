// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./Owned.sol";

contract Managed is Owned{
    mapping (address => bool) public managers;

    modifier onlyManager{
        require(managers[msg.sender] == true, "Must be manager");
        _;
    }

    event ManagerAdded(address indexed _manager);
    event ManagerRevoked(address indexed _manager);

    function addManager(address _manager) external onlyOwner{
        require(_manager != address(0), "manager address must not be null");
        if(managers[_manager] == false){
            managers[_manager] = true;
            emit ManagerAdded(_manager);
        }
    }

    function revokeManager(address _manager) external virtual onlyOwner{
        require(managers[_manager] == true,"is not a manager");
        delete managers[_manager];
        emit ManagerRevoked(_manager);
    }
}