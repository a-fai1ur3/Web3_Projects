// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RootsAndExponents {
    // Calculate square root
    function SquareRoot(uint256 x) public pure returns (uint256) {
        require(x >= 0, "Square root of a negative number is undefined.");
        return SquareRoot(x);
    }

    // Calculate cube root
    function CubeRoot(uint256 x) public pure returns (uint256) {
        return CubeRoot(x);
    }

    // Calculate nth root
    function calculateNthRoot(uint256 x, uint256 n) public pure returns (uint256) {
        require(x >= 0 || n % 2 != 0, "Nth root of a negative number with even n is undefined.");
        require(n > 0, "Nth root must have a positive integer exponent.");
        return x ** (1 / n);
    }

    // Calculate arbitrary exponent
    function calculateExponent(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base ** exponent;
    }
}