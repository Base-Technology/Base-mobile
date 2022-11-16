// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.3;

interface IModule {
    function init(address _wallet) external;
    // function addModule(address _wallet, address _moduel) external;
    function supportsStaticCall(bytes4 _methodId) external view returns (bool _isSupported);
}