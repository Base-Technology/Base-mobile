// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/**
 * @title Proxy
 * @notice Basic proxy that delegates all calls to a fixed implementing contract.
 * The implementing contract cannot be upgraded.
 * @author Julien Niset - <julien@argent.xyz>
 */
contract Proxy {

    address immutable public implementation;

    event Received(uint indexed value, address indexed sender, bytes data);

    constructor(address _implementation) {
        implementation = _implementation;
    }

    fallback() external payable {
        address target = implementation;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), target, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {revert(0, returndatasize())}
            default {return (0, returndatasize())}
        }
    }

    receive() external payable {
        emit Received(msg.value, msg.sender, "");
    }
}