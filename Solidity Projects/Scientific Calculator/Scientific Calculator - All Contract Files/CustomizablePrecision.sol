// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomizablePrecision {
    uint256 public precision;

    constructor(uint256 initialPrecision) {
        precision = initialPrecision;
    }

    // Set the precision level
    function setPrecision(uint256 newPrecision) public {
        precision = newPrecision;
    }

    // Perform addition with custom precision
    function addWithPrecision(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Perform subtraction with custom precision
    function subtractWithPrecision(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }

    // Perform multiplication with custom precision
    function multiplyWithPrecision(uint256 a, uint256 b) public view returns (uint256) {
        return (a * b) / (10**precision);
    }

    // Perform division with custom precision
    function divideWithPrecision(uint256 a, uint256 b) public view returns (uint256) {
        require(b != 0, "Division by zero.");
        return (a * 10**precision) / b;
    }
}
