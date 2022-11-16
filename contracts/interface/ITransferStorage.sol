// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

interface ITransferStorage{
    function setWhitelist(address _wallet, address _target, uint256 _value) external;
    function getWhitelist(address _wallet, address _target) external view returns(uint256);
}