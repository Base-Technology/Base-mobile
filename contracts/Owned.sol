// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Owned {
    address public owner;

    event OwnerChanged(address indexed _newOwner);

    modifier onlyOwner {
        require(msg.sender == owner,"Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function changeOwner(address _newOwner)external onlyOwner{
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;
        emit OwnerChanged(_newOwner);
    }
}