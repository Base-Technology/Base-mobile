// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./interface/IFilter.sol";

contract Filter is IFilter {

    address private immutable masterSigner;

    constructor(address _masterSigner) {
        masterSigner = _masterSigner;
    }
    
    function isValid(address _wallet, address /*_spender*/, address /*_to*/, bytes calldata _data) external view override returns (bool valid) {
        if (_data.length < 4 + 65 + 32) {
            return false;
        }

        uint256 dataLength = _data.length;
        bytes calldata swapData = _data[:dataLength - 65 - 32];
        uint256 deadline = abi.decode(_data[_data.length - 65 - 32: _data.length - 65], (uint256));
        bytes calldata signature = _data[dataLength - 65:];

        if (deadline < block.number) {
            return false;
        }

        bytes32 signedHash = getSignedHash(_wallet, deadline, swapData);
        return validateSignature(signedHash, signature, masterSigner);
    }
    function getSignedHash(address _wallet, uint256 _deadline, bytes calldata _swapData) internal pure returns (bytes32) {
        bytes32 message = keccak256(abi.encodePacked(_wallet, _deadline, _swapData));
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", message));
    }
    function validateSignature(bytes32 _signedHash, bytes calldata _signature, address _account) internal pure returns (bool) {
        uint8 v;
        bytes32 r;
        bytes32 s;
        assembly {
            r := calldataload(_signature.offset)
            s := calldataload(add(_signature.offset, 0x20))
            v := byte(0, calldataload(add(_signature.offset, 0x40)))
        }

        return ecrecover(_signedHash, v, r, s) == _account;
    }

}