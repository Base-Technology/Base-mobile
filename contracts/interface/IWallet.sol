// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

interface IWallet {
    /**
     * @notice Initialize a wallet
     * @param _owner The owner of the wallet
     * @param _modules the modules list to authorise
     */
    function init(address _owner, address[] calldata _modules) external;

    /**
     * @notice check if an address is an onwer
     * @param _owner the address to check
     * @return bool if the _owner is an owner
     */
    function isOwner( address _owner)
        external
        view
        returns (bool);

    /**
     * @notice add a new owner to a wallet
     * @param _owner the new owner address
     */
    function addOwner( address _owner) external;

    /**
     * @notice remove a new owner from a wallet
     * @param _owner the owner to remove
     */
    function deleteOwner( address _owner) external;

    /**
     * @notice  substitute new owner for old owner
     * @param _oldOwner the owner of the replacement
     * @param _newOwner the owner of substitution
     */
    function changeOwner(
        address _oldOwner,
        address _newOwner
    ) external;

/**
     * @notice get all the owners of the wallet
     * @return owners the owners list of the wallet
     */
    function getOwners() external view returns (address[] memory);
    function setOwnerAfterRecovery(address _newOwner) external;
    function enabled(bytes4 _sig) external view returns (address);
    function enableStaticCall(address _module, bytes4 _method) external;
}
