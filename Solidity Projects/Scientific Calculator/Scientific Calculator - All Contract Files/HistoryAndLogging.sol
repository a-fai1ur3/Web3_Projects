// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HistoryAndLogging {
    string[] private calculationHistory;

    // Perform a calculation and add it to the history
    function performAndLogCalculation(string memory calculation) public {
        calculationHistory.push(calculation);
    }

    // Get the history of calculations
    function getCalculationHistory() public view returns (string[] memory) {
        return calculationHistory;
    }

    // Get the most recent calculation
    function getMostRecentCalculation() public view returns (string memory) {
        require(calculationHistory.length > 0, "No calculations in history.");
        return calculationHistory[calculationHistory.length - 1];
    }
}