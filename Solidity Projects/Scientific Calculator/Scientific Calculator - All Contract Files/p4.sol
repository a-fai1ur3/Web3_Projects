// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Logarithmic operations
contract LogarithmicFunctions {
    function naturalLogarithm(uint256 x) public pure returns (int256) {
        require(x > 0, "Natural logarithm undefined for x <= 0.");
        return int256(log(x));
        }

    function base10Logarithm(uint256 x) public pure returns (int256) {
        require(x > 0, "Base-10 logarithm undefined for x <= 0.");
        return int256(log10(x));
        }
}