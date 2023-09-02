// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EquationSolving {
    // Quadratic equation solver
    function solveQuadratic(uint256 a, uint256 b, uint256 c) public pure returns (int256, int256) {
        int256 discriminant = int256(b * b) - 4 * int256(a) * int256(c);
        
        if (discriminant < 0) {
            // No real roots
            return (-1, -1);
        } else if (discriminant == 0) {
            // One real root
            int256 root = -int256(b) / (2 * int256(a));
            return (root, root);
        } else {
            // Two real roots
            int256 root1 = (-int256(b) + int256(discriminant)) / (2 * int256(a));
            int256 root2 = (-int256(b) - int256(discriminant)) / (2 * int256(a));
            return (root1, root2);
        }
    }
}