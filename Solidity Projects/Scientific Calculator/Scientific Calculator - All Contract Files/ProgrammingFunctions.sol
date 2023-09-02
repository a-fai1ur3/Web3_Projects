// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProgrammingFunctions {
    // Bitwise left shift
    function bitwiseLeftShift(uint256 a, uint256 n) public pure returns (uint256) {
        return a << n;
    }

    // Bitwise right shift
    function bitwiseRightShift(uint256 a, uint256 n) public pure returns (uint256) {
        return a >> n;
    }

    // Logical AND
    function logicalAnd(bool a, bool b) public pure returns (bool) {
        return a && b;
    }

    // Logical OR
    function logicalOr(bool a, bool b) public pure returns (bool) {
        return a || b;
    }

    // Logical NOT
    function logicalNot(bool a) public pure returns (bool) {
        return !a;
    }
}