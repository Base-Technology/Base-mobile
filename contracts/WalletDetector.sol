// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "./Owned.sol";

interface IBaseWallet{
    function implementation() external view returns(address);
}

contract WalletDetector is Owned {
    bytes32[] private codes;
    address[] private implementations;
    mapping (bytes32 => Info) public acceptedCodes;
    mapping (address => Info) public acceptedImplementations;

    struct Info{
        bool exists;
        uint128 index;
    }

    event AddCode(bytes32 indexed code);
    event AddImplementation(address indexed implementation);

    constructor(bytes32[] memory _codes, address[] memory _implementations){
        for (uint i = 0; i < _codes.length; i++){
            addCode(_codes[i]);
        }
        for (uint i = 0; i < _implementations.length; i++){
            addImplementation(_implementations[i]);
        }
    }

    function addCode(bytes32 _code) public onlyOwner{
        require(_code != bytes32(0),"empty code");
        if(!acceptedCodes[_code].exists){
            codes.push(_code);
            acceptedCodes[_code].exists = true;
            acceptedCodes[_code].index = uint128(codes.length - 1);
            emit AddCode(_code);
        }
    }
    function addImplementation(address _implementation) public onlyOwner{
        require(_implementation != address(0),"empty implementation");
        if(!acceptedImplementations[_implementation].exists){
            implementations.push(_implementation);
            acceptedImplementations[_implementation].exists = true;
            acceptedImplementations[_implementation].index = uint128(implementations.length - 1);
            emit AddImplementation(_implementation);
        }
    }
    
    function addCodeAndImplementationFromWallet(address _wallet) external onlyOwner{
        bytes32 codeHash;
        assembly {
            codeHash := extcodehash(_wallet)
        }
        addCode(codeHash);
        address implementation = IBaseWallet(_wallet).implementation();
        addImplementation(implementation);
    }

    function getImplementations() public view returns(address[] memory){
        return implementations;
    }

    function getCodes() public view returns(bytes32[] memory){
        return codes;
    }
    function isWallet(address _wallet) external view returns(bool){
        bytes32 codeHash;
        assembly {
            codeHash := extcodehash(_wallet)
        }
        return acceptedCodes[codeHash].exists && acceptedImplementations[IBaseWallet(_wallet).implementation()].exists;
    }
}