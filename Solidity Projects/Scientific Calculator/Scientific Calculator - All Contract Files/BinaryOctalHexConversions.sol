// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BinaryOctalHexConversions {
    // Convert decimal to binary
    function decimalToBinary(uint256 decimalValue) public pure returns (string memory) {
        return toBaseN(decimalValue, 2);
    }

    // Convert decimal to octal
    function decimalToOctal(uint256 decimalValue) public pure returns (string memory) {
        return toBaseN(decimalValue, 8);
    }

    // Convert decimal to hexadecimal
    function decimalToHex(uint256 decimalValue) public pure returns (string memory) {
        return toBaseN(decimalValue, 16);
    }

    // Convert binary to decimal
    function binaryToDecimal(string memory binaryValue) public pure returns (uint256) {
        return parseInt(binaryValue, 2);
    }

    // Convert octal to decimal
    function octalToDecimal(string memory octalValue) public pure returns (uint256) {
        return parseInt(octalValue, 8);
    }

    // Convert hexadecimal to decimal
    function hexToDecimal(string memory hexValue) public pure returns (uint256) {
        return parseInt(hexValue, 16);
    }

    // Helper function to convert to base N
    function toBaseN(uint256 decimalValue, uint256 base) internal pure returns (string memory) {
        if (decimalValue == 0) {
            return "0";
        }
        uint256 value = decimalValue;
        uint256 length = 0;
        while (value > 0) {
            length++;
            value /= base;
        }
        bytes memory result = new bytes(length);
        value = decimalValue;
        for (uint256 i = length - 1; i >= 0; i--) {
            uint256 remainder = value % base;
            value /= base;
            if (remainder < 10) {
                result[i] = bytes1(uint8(48 + remainder)); // Convert to ASCII
            } else {
                result[i] = bytes1(uint8(87 + remainder)); // Convert to ASCII (a-f)
            }
        }
        return string(result);
    }

    // Helper function to parse integer from string
    function parseInt(string memory value, uint256 base) internal pure returns (uint256) {
        bytes memory bytesValue = bytes(value);
        uint256 result = 0;
        uint256 multiplier = 1;
        for (uint256 i = bytesValue.length - 1; i + 1 > 0; i--) {
            uint256 c = uint256(uint8(bytesValue[i]));
            if (c >= 48 && c <= 57) {
                result += (c - 48) * multiplier;
            } else if (c >= 97 && c <= 102) {
                result += (c - 87) * multiplier;
            }
            multiplier *= base;
        }
        return result;
    }
}