// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./interface/ITransferStorage.sol";

contract TransferStorage is ITransferStorage{
    mapping (address => mapping(address => uint256)) internal whitelist;
    function setWhitelist(address _wallet, address _target, uint256 _value) external {
        whitelist[_wallet][_target] = _value;
    }
    function getWhitelist(address _wallet,address _target) external view returns(uint256){
       return whitelist[_wallet][_target]; 
    }
}