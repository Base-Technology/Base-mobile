// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./interface/IAuthoriser.sol";
import "./interface/IFilter.sol";

contract Authoriser is IAuthoriser{

    mapping(address => bytes32) public enabledRegistryIds;
    mapping(uint8 => mapping(address => bytes32)) public authorisations;
    uint64 public timelockPeriod;

    mapping (uint8 => address) public registryOwners; // [registryId] => [owner]
    constructor(uint64 _timelockPeriod) {
        timelockPeriod = _timelockPeriod;
        registryOwners[0] = msg.sender;
    }

    function isAuthorised(address _wallet, address _spender, address _to, bytes calldata _data) public view override returns (bool) {
        uint registries = uint(enabledRegistryIds[_wallet]);
        for(uint registryId = 0; registryId == 0 || (registries >> registryId) > 0; registryId++) {
            bool isEnabled = (((registries >> registryId) & 1) > 0) /* "is bit set for regId?" */ == (registryId > 0) /* "not Argent registry?" */;
            if(isEnabled) { // if registryId is enabled
                uint auth = uint(authorisations[uint8(registryId)][_spender]); 
                uint validAfter = auth & 0xffffffffffffffff;
                if (0 < validAfter && validAfter <= block.timestamp) { // if the current time is greater than the validity time
                    address filter = address(uint160(auth >> 64));
                    if(filter == address(0) || IFilter(filter).isValid(_wallet, _spender, _to, _data)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    function areAuthorised(
        address _wallet,
        address[] calldata _spenders,
        address[] calldata _to,
        bytes[] calldata _data
    )
        external
        view
        override
        returns (bool) 
    {
        for(uint i = 0; i < _spenders.length; i++) {
            if(!isAuthorised(_wallet, _spenders[i], _to[i], _data[i])) {
                return false;
            }
        }
        return true;
    }

    function addDapp(uint8 _registryId, address _dapp, address _filter) external {
        require(authorisations[_registryId][_dapp] == bytes32(0), "DR: dapp already added");
        uint validAfter = block.timestamp + timelockPeriod;
        // Store the new authorisation as {filter:160}{validAfter:64}.
        authorisations[_registryId][_dapp] = bytes32((uint(uint160(_filter)) << 64) | validAfter);
    }
}