// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.3;

import "./interface/IModule.sol";

contract TestModule{
     address addr;

     constructor() public {
      addr = msg.sender;
    }
    
}