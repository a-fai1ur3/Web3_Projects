// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinancialFunctions {
    // Calculate loan payments
    function calculateLoanPayment(
        uint256 principal,
        uint256 annualInterestRate,
        uint256 numMonths
    ) public pure returns (uint256) {
        require(numMonths > 0, "Number of months must be greater than zero.");
        require(annualInterestRate >= 0, "Annual interest rate cannot be negative.");
        uint256 monthlyInterestRate = (annualInterestRate * 100) / 12 / 100;
        uint256 denominator = (1 - (1 + monthlyInterestRate)**(-uint256(numMonths))) / monthlyInterestRate;
        return (principal * denominator) / 100;
    }

    // Calculate future value
    function calculateFutureValue(
        uint256 presentValue,
        uint256 annualInterestRate,
        uint256 numYears
    ) public pure returns (uint256) {
        require(numYears >= 0, "Number of years cannot be negative.");
        require(annualInterestRate >= 0, "Annual interest rate cannot be negative.");
        return (presentValue * (1 + (annualInterestRate * 100) / 100))**numYears / 100;
    }

    // Calculate present value
    function calculatePresentValue(
        uint256 futureValue,
        uint256 annualInterestRate,
        uint256 numYears
    ) public pure returns (uint256) {
        require(numYears >= 0, "Number of years cannot be negative.");
        require(annualInterestRate >= 0, "Annual interest rate cannot be negative.");
        return (futureValue * 100) / ((1 + (annualInterestRate * 100) / 100)**numYears);
    }
}