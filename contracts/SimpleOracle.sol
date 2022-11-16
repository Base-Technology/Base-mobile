// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router01.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";

contract SimpleOracle {
    address internal immutable weth;
    address internal immutable uniswapV2Factory;
    // address internal weth;
    // address internal uniswapV2Factory;

    constructor(address _uniswapRouter) {
        weth = IUniswapV2Router01(_uniswapRouter).WETH();
        uniswapV2Factory = IUniswapV2Router01(_uniswapRouter).factory();
    }

    function inToken(address _token, uint256 _ethAmount)
        internal
        view
        returns (uint256)
    {
        (uint256 wethReserve, uint256 tokenReserve) = getReservesForTokenPool(
            _token
        );
        return (_ethAmount * tokenReserve) / wethReserve;
    }

    function getReservesForTokenPool(address _token)
        internal
        view
        returns (uint256 wethReserve, uint256 tokenReserve)
    {
        if (weth < _token) {
            address pair = getPairForSorted(weth, _token);
            (wethReserve, tokenReserve, ) = IUniswapV2Pair(pair).getReserves();
        } else {
            address pair = getPairForSorted(_token, weth);
            (tokenReserve, wethReserve, ) = IUniswapV2Pair(pair).getReserves();
        }
        require(wethReserve != 0 && tokenReserve != 0, "SO: no liquidity");
    }

    function getPairForSorted(address tokenA, address tokenB)
        internal
        view
        virtual
        returns (address)
    {
        address pair = address(
            uint160(
                uint256(
                    keccak256(
                        abi.encodePacked(
                            hex"ff",
                            uniswapV2Factory,
                            keccak256(abi.encodePacked(tokenA, tokenB)),
                            hex"96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f"
                        )
                    )
                )
            )
        );
        return pair;
    }
}
