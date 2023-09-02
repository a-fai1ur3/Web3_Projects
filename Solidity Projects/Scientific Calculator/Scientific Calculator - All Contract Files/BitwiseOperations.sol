// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitwiseOperations {
    // Bitwise AND
    function bitwiseAnd(uint256 a, uint256 b) public pure returns (uint256) {
        return a & b;
    }

    // Bitwise OR
    function bitwiseOr(uint256 a, uint256 b) public pure returns (uint256) {
        return a | b;
    }

    // Bitwise XOR
    function bitwiseXor(uint256 a, uint256 b) public pure returns (uint256) {
        return a ^ b;
    }

    // Bitwise NOT
    function bitwiseNot(uint256 a) public pure returns (uint256) {
        return ~a;
    }
}