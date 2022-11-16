// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

interface IAuthoriser{
    function isAuthorised(address _wallet, address _spender, address _to, bytes calldata _data) external view returns(bool);
    function areAuthorised(address _wallet, address[] calldata _spenders, address[] calldata _to, bytes[] calldata _data) external view returns(bool);
}