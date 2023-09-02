// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Calculator.sol";

contract UnitTesting {
    Calculator calculator = Calculator(DeployedAddresses.Calculator());

    // Test the addition function
    function testAddition() public {
        uint256 result = calculator.add(2, 3);
        uint256 expected = 5;
        Assert.equal(result, expected, "Addition function should return the correct result.");
    }

    // Test the subtraction function
    function testSubtraction() public {
        uint256 result = calculator.subtract(5, 3);
        uint256 expected = 2;
        Assert.equal(result, expected, "Subtraction function should return the correct result.");
    }

    // Test the multiplication function
    function testMultiplication() public {
        uint256 result = calculator.multiply(2, 3);
        uint256 expected = 6;
        Assert.equal(result, expected, "Multiplication function should return the correct result.");
    }

    // Test the division function
    function testDivision() public {
        uint256 result = calculator.divide(6, 2);
        uint256 expected = 3;
        Assert.equal(result, expected, "Division function should return the correct result.");
    }

    // More test cases can be added for other functions...

    // Ensure that the contract's initial state is as expected
    function testInitialBalance() public {
        uint256 initialBalance = calculator.getBalance();
        uint256 expected = 0;
        Assert.equal(initialBalance, expected, "Initial balance should be zero.");
    }
}
