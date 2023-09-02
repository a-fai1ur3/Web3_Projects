// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryFunctions {
    uint256 private memoryValue; // Memory storage

    // Store a value in memory (M+)
    function addToMemory(uint256 value) public {
        memoryValue += value;
    }

    // Subtract a value from memory (M-)
    function subtractFromMemory(uint256 value) public {
        if (memoryValue >= value) {
            memoryValue -= value;
        }
    }

    // Recall the value from memory (MR)
    function recallMemory() public view returns (uint256) {
        return memoryValue;
    }

    // Clear the memory (MC)
    function clearMemory() public {
        memoryValue = 0;
    }
}