// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constants {
    // Mathematical constants
    function getPi() public pure returns (uint256) {
        return 31415926535; // Value of π (pi) as an integer
    }

    function getEuler() public pure returns (uint256) {
        return 27182818284; // Value of Euler's number (e) as an integer
    }
}