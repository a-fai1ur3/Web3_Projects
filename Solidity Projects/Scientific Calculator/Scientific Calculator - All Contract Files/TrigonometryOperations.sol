// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrigonometryOperations {
    function sine(uint256 angle) public pure returns (int256) {
        return int256(sine(angle));
        }
    function cosine(uint256 angle) public pure returns (int256) {
        return int256(cosine(angle));
        }
    function tangent(uint256 angle) public pure returns (int256) {
        return int256(tangent(angle));
        }
    function cosecant(uint256 angle) public pure returns (int256) {
        require(angle != 0, "Cosecant undefined at 0 degrees.");
        return int256(1) / int256(sine(angle));
        }
    function secant(uint256 angle) public pure returns (int256) {
        require(angle != 90 && angle != 270, "Secant undefined at 90 and 270 degrees.");
        return int256(1) / int256(cosine(angle));
        }
    function cotangent(uint256 angle) public pure returns (int256) {
        require(angle != 0 && angle != 180 && angle != 360, "Cotangent undefined at 0, 180, and 360 degrees.");
        return int256(1) / int256(tangent(angle));
        }
}









        

        
        

        