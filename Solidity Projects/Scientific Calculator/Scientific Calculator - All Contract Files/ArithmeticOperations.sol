// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArithmeticOperations {
    // Function to add two numbers and return the result
    function addition(uint256 num1, uint256 num2) public pure returns (uint256) {
        return num1 + num2;
    }

    // Function to subtract two numbers and return the result
    function subtraction(uint256 num1, uint256 num2) public pure returns (uint256) {
        require(num1 >= num2, "Subtraction result cannot be negative.");
        return num1 - num2;
    }

    // Function to multiply two numbers and return the result
    function multiplication(uint256 num1, uint256 num2) public pure returns (uint256) {
        return num1 * num2;
    }

    // Function to divide two numbers and return the result
    function division(uint256 num1, uint256 num2) public pure returns (uint256) {
        require(num2 != 0, "Division by zero is not allowed.");
        return num1 / num2;
    }

    // Function to calculate the exponentiation of a number
    function exponentiation(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base ** exponent;
    }
}