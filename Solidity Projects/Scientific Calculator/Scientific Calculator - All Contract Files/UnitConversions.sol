// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnitConversions {
    // Length conversions
    function metersToFeet(uint256 meters) public pure returns (uint256) {
        // 1 meter = 3.28084 feet
        return (meters * 32808) / 10000;
    }

    function feetToMeters(uint256 feet) public pure returns (uint256) {
        // 1 foot = 0.3048 meters
        return (feet * 3048) / 10000;
    }

    // Mass conversions
    function kilogramsToPounds(uint256 kilograms) public pure returns (uint256) {
        // 1 kilogram = 2.20462 pounds
        return (kilograms * 22046) / 10000;
    }

    function poundsToKilograms(uint256 pounds) public pure returns (uint256) {
        // 1 pound = 0.453592 kilograms
        return (pounds * 4536) / 10000;
    }

    // Temperature conversions (Celsius to Fahrenheit and vice versa)
    function celsiusToFahrenheit(int256 celsius) public pure returns (int256) {
        // (0°C × 9/5) + 32 = 32°F
        return (celsius * 9) / 5 + 32;
    }

    function fahrenheitToCelsius(int256 fahrenheit) public pure returns (int256) {
        // (0°F − 32) × 5/9 = -17.778°C
        return ((fahrenheit - 32) * 5) / 9;
    }
}