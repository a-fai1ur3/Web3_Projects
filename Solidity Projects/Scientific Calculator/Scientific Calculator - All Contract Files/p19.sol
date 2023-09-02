// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScientificNotation {
    // Convert a number in scientific notation to a decimal number
    function scientificToDecimal(string memory scientificNotation) public pure returns (uint256) {
        require(bytes(scientificNotation).length > 0, "Scientific notation cannot be empty.");
        
        // Split the scientific notation into its components: coefficient and exponent
        (string memory coefficientStr, string memory exponentStr) = splitScientificNotation(scientificNotation);
        
        // Parse the coefficient and exponent
        uint256 coefficient = parseDecimal(coefficientStr);
        int256 exponent = parseInt(exponentStr);
        
        // Calculate the decimal representation
        if (exponent >= 0) {
            // Positive exponent, e.g., 1.23e4
            return coefficient * 10**uint256(exponent);
        } else {
            // Negative exponent, e.g., 1.23e-4
            return coefficient / 10**uint256(-exponent);
        }
    }
    
    // Convert a decimal number to scientific notation
    function decimalToScientific(uint256 decimalNumber) public pure returns (string memory) {
        if (decimalNumber == 0) {
            return "0";
        }
        
        // Determine the sign (positive/negative) of the number
        bool isNegative = false;
        if (int256(decimalNumber) < 0) {
            isNegative = true;
            decimalNumber = uint256(-int256(decimalNumber));
        }
        
        // Find the first non-zero digit and its position
        uint256 position = 0;
        uint256 number = decimalNumber;
        while (number % 10 == 0) {
            number /= 10;
            position++;
        }
        
        // Calculate the coefficient and exponent
        uint256 coefficient = number;
        int256 exponent = int256(position);
        
        // Convert the coefficient and exponent to strings
        string memory coefficientStr = uint256ToString(coefficient);
        string memory exponentStr = int256ToString(exponent);
        
        // Combine the parts into scientific notation
        string memory scientificNotation = string(abi.encodePacked(coefficientStr, "e", exponentStr));
        
        // Add a minus sign for negative numbers
        if (isNegative) {
            scientificNotation = string(abi.encodePacked("-", scientificNotation));
        }
        
        return scientificNotation;
    }
    
    // Split scientific notation into coefficient and exponent parts
    function splitScientificNotation(string memory scientificNotation) internal pure returns (string memory, string memory) {
        bytes memory scientificBytes = bytes(scientificNotation);
        for (uint256 i = 0; i < scientificBytes.length; i++) {
            if (scientificBytes[i] == "e") {
                string memory coefficientPart = substring(scientificNotation, 0, i);
                string memory exponentPart = substring(scientificNotation, i + 1, scientificBytes.length - i - 1);
                return (coefficientPart, exponentPart);
            }
        }
        revert("Invalid scientific notation format.");
    }
    
    // Parse a decimal number from a string
    function parseDecimal(string memory decimalStr) internal pure returns (uint256) {
        bytes memory bytesStr = bytes(decimalStr);
        uint256 result = 0;
        uint256 decimalPointPosition = bytesStr.length;
        for (uint256 i = 0; i < bytesStr.length; i++) {
            if (bytesStr[i] == ".") {
                decimalPointPosition = i;
            } else {
                uint8 digit = uint8(bytesStr[i]) - uint8("0");
                require(digit <= 9, "Invalid digit in decimal string.");
                result = result * 10 + digit;
            }
        }
        return result;
    }
    
    // Parse an integer from a string
    function parseInt(string memory intStr) internal pure returns (int256) {
        bytes memory bytesStr = bytes(intStr);
        int256 result = 0;
        bool isNegative = false;
        for (uint256 i = 0; i < bytesStr.length; i++) {
            if (i == 0 && bytesStr[i] == "-") {
                isNegative = true;
            } else {
                uint8 digit = uint8(bytesStr[i]) - uint8("0");
                require(digit <= 9, "Invalid digit in integer string.");
                result = result * 10 + int256(digit);
            }
        }
        if (isNegative) {
            result = -result;
        }
        return result;
    }
    
    // Convert a uint256 to a string
    function uint256ToString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 length;
        while (temp > 0) {
            length++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(length);
        while (value > 0) {
            length--;
            buffer[length] = bytes1(uint8(48 + (value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
    
    // Get a substring from a string
    function substring(string memory str, uint256 startIndex, uint256 length) internal pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        require(startIndex + length <= strBytes.length, "Substring bounds out of range.");
        bytes memory result = new bytes(length);
        for (uint256 i = 0; i < length; i++) {
            result[i] = strBytes[startIndex + i];
        }
        return string(result);
    }
}
