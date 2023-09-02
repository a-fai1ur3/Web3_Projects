// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OtherFunctions {
    function squareRoot(uint256 x) public pure returns (uint256) {
        require(x >= 0, "Square root undefined for negative numbers.");
        return squareRoot(x);
        }

    function absoluteValue(int256 x) public pure returns (uint256) {
        return uint256(absoluteValue(x));
        }

    function factorial(uint256 n) public pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 2; i <= n; i++) {
            result *= i;
        }
        return result;
        }

    function exponential(uint256 x) public pure returns (uint256) {
        return exponential(x);
    }
}