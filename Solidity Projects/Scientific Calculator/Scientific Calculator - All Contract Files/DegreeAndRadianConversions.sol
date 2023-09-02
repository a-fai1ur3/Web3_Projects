// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DegreeAndRadianConversions {
        // Convert degrees to radians
    function degreesToRadians(uint256 degrees) public pure returns (uint256) {
        return (degrees * 31415926535) / 180; // π * degrees / 180
        }

        // Convert radians to degrees
    function radiansToDegrees(uint256 radians) public pure returns (uint256) {
        return (radians * 180) / 31415926535; // radians * 180 / π
        }
}