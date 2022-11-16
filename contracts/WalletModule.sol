// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./BaseModule.sol";
import "./SecurityManager.sol";
import "./RelayerManager.sol";
import "./TransactionManager.sol";
import "./Utils.sol";

// contract WalletModule is BaseModule, SecurityManager{
contract WalletModule is BaseModule, SecurityManager, RelayerManager,TransactionManager {
    constructor(
        IModuleRegistry _registry,
        IGuardianStorage _guardianStorage,
        ITransferStorage _userWhitelist,
        IAuthoriser _authoriser,
        address _uniswapRouter,
        uint256 _securityPeriod,
        uint256 _securityWindow,
        uint256 _lockPeriod,
        uint256 _recoveryPeriod
    )
        BaseModule(_registry,_guardianStorage,_userWhitelist, _authoriser)
        SecurityManager(
            _securityPeriod,
            _securityWindow,
            _lockPeriod,
            _recoveryPeriod
        )
        TransactionManager(_securityPeriod)
        RelayerManager(_uniswapRouter)
        // RelayerManager()
    {}

    function init(address _wallet) external override {
        uint256 a = 1;
    }

    function getRequiredSignatures(address _wallet, bytes calldata _data)
        public
        view
        override
        returns (uint256, OwnerSignature)
    {
        bytes4 methodId = Utils.functionPrefix(_data);
        if (methodId == TransactionManager.multiCall.selector ||
            methodId == TransactionManager.addToWhitelist.selector
           )
        {
            // owner
            return (1, OwnerSignature.Required);
        }
        if (methodId == SecurityManager.executeRecovery.selector) {
            uint256 numberOfSignaturesRequired = numberOfGuardiansRequired(
                _wallet,
                1
            );
            require(
                numberOfSignaturesRequired > 0,
                "Error: no guardians on wallet"
            );
            return (numberOfSignaturesRequired, OwnerSignature.Disallowed);
        }
        if (methodId == SecurityManager.cancelRecovery.selector) {
            uint256 numberOfSignaturesRequired = numberOfGuardiansRequired(
                _wallet,
                2
            );
            return (numberOfSignaturesRequired, OwnerSignature.Optional);
        }
        if (methodId == SecurityManager.finalizeRecovery.selector) {
            return (0, OwnerSignature.Anyone);
        }
        if (methodId == SecurityManager.lock.selector || methodId == SecurityManager.unlock.selector) {
            return (1, OwnerSignature.Disallowed);
        }
    }

    function numberOfGuardiansRequired(address _wallet, uint256 _method)
        internal
        view
        returns (uint256)
    {
        uint256 count = guardianStorage.guardianCount(_wallet);
        if (_method == 2) {
            count = count + 1;
        }
        uint256 req = count / 2;
        if (count % 2 != 0) {
            req = req + 1;
        }
        return req;
    }
}