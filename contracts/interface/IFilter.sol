// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

interface IFilter{
    function isValid(address _wallet, address _spender, address _to, bytes calldata _data) external view returns (bool valid);
}