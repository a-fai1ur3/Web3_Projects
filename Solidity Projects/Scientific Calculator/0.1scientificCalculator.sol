// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArithmeticOperations {
    // Function to add two numbers and return the result
    function addition(uint256 num1, uint256 num2) public pure returns (uint256) {
        return num1 + num2;
    }

    // Function to subtract two numbers and return the result
    function subtraction(uint256 num1, uint256 num2) public pure returns (uint256) {
        require(num1 >= num2, "Subtraction result cannot be negative.");
        return num1 - num2;
    }

    // Function to multiply two numbers and return the result
    function multiplication(uint256 num1, uint256 num2) public pure returns (uint256) {
        return num1 * num2;
    }

    // Function to divide two numbers and return the result
    function division(uint256 num1, uint256 num2) public pure returns (uint256) {
        require(num2 != 0, "Division by zero is not allowed.");
        return num1 / num2;
    }

    // Function to calculate the exponentiation of a number
    function exponentiation(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base ** exponent;
    }
}

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

contract HyperbolicOperations {
    function sinh(uint256 x) public pure returns (int256) {
        return int256(sinh(x));
        }

    function cosh(uint256 x) public pure returns (int256) {
        return int256(cosh(x));
        }

    function tanh(uint256 x) public pure returns (int256) {
        return int256(tanh(x));
        }
}

// look for logarithemic functions contract again 
// look for othr function contract again

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

contract ComplexNumberOperations {
    struct ComplexNumber {
        int256 real;
        int256 imag;
        }
    

    // Add two complex numbers
    function addComplexNumbers(ComplexNumber memory num1, ComplexNumber memory num2) public pure returns (ComplexNumber memory) {
        ComplexNumber memory result;
        result.real = num1.real + num2.real;
        result.imag = num1.imag + num2.imag;
        return result;
        }

    // Subtract two complex numbers
    function subtractComplexNumbers(ComplexNumber memory num1, ComplexNumber memory num2) public pure returns (ComplexNumber memory) {
        ComplexNumber memory result;
        result.real = num1.real - num2.real;
        result.imag = num1.imag - num2.imag;
        return result;
        }

    // Multiply two complex numbers
    function multiplyComplexNumbers(ComplexNumber memory num1, ComplexNumber memory num2) public pure returns (ComplexNumber memory) {
        ComplexNumber memory result;
        result.real = num1.real * num2.real - num1.imag * num2.imag;
        result.imag = num1.real * num2.imag + num1.imag * num2.real;
        return result;
        }

    // Divide two complex numbers
    function divideComplexNumbers(ComplexNumber memory num1, ComplexNumber memory num2) public pure returns (ComplexNumber memory) {
        ComplexNumber memory result;
        int256 denominator = num2.real * num2.real + num2.imag * num2.imag;
        result.real = (num1.real * num2.real + num1.imag * num2.imag) / denominator;
        result.imag = (num1.imag * num2.real - num1.real * num2.imag) / denominator;
        return result;
        }

    // Conjugate of a complex number
    function conjugateComplexNumber(ComplexNumber memory num) public pure returns (ComplexNumber memory) {
        ComplexNumber memory result;
        result.real = num.real;
        result.imag = -num.imag;
        return result;
        }
}

contract Constants {
    // Mathematical constants
    function getPi() public pure returns (uint256) {
        return 31415926535; // Value of π (pi) as an integer
    }

    function getEuler() public pure returns (uint256) {
        return 27182818284; // Value of Euler's number (e) as an integer
    }
}

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

contract HistoryAndLogging {
    string[] private calculationHistory;

    // Perform a calculation and add it to the history
    function performAndLogCalculation(string memory calculation) public {
        calculationHistory.push(calculation);
    }

    // Get the history of calculations
    function getCalculationHistory() public view returns (string[] memory) {
        return calculationHistory;
    }

    // Get the most recent calculation
    function getMostRecentCalculation() public view returns (string memory) {
        require(calculationHistory.length > 0, "No calculations in history.");
        return calculationHistory[calculationHistory.length - 1];
    }
}

contract HelpAndDocumentation {
    string public documentation;

    constructor(string memory initialDocumentation) {
        documentation = initialDocumentation;
    }

    // Update the documentation
    function updateDocumentation(string memory newDocumentation) public {
        documentation = newDocumentation;
    }
}

contract CustomizablePrecision {
    uint256 public precision;

    constructor(uint256 initialPrecision) {
        precision = initialPrecision;
    }

    // Set the precision level
    function setPrecision(uint256 newPrecision) public {
        precision = newPrecision;
    }

    // Perform addition with custom precision
    function addWithPrecision(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Perform subtraction with custom precision
    function subtractWithPrecision(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }

    // Perform multiplication with custom precision
    function multiplyWithPrecision(uint256 a, uint256 b) public view returns (uint256) {
        return (a * b) / (10**precision);
    }

    // Perform division with custom precision
    function divideWithPrecision(uint256 a, uint256 b) public view returns (uint256) {
        require(b != 0, "Division by zero.");
        return (a * 10**precision) / b;
    }
}

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

contract OtherFunctions {
    function squareRoot(uint256 x) public pure returns (uint256) {
        require(x >= 0, "Square root undefined for negative numbers.");
        return squareRoot(x);
        }

    function absoluteValue(int256 x) public pure returns (uint256) {
        return uint256(absoluteValue(x));
        }

    function factorial(uint256 n) public pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 2; i <= n; i++) {
            result *= i;
        }
        return result;
        }

    function exponential(uint256 x) public pure returns (uint256) {
        return exponential(x);
    }
}

contract RootsAndExponents {
    // Calculate square root
    function SquareRoot(uint256 x) public pure returns (uint256) {
        require(x >= 0, "Square root of a negative number is undefined.");
        return SquareRoot(x);
    }

    // Calculate cube root
    function CubeRoot(uint256 x) public pure returns (uint256) {
        return CubeRoot(x);
    }

    // Calculate nth root
    function calculateNthRoot(uint256 x, uint256 n) public pure returns (uint256) {
        require(x >= 0 || n % 2 != 0, "Nth root of a negative number with even n is undefined.");
        require(n > 0, "Nth root must have a positive integer exponent.");
        return x ** (1 / n);
    }

    // Calculate arbitrary exponent
    function calculateExponent(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base ** exponent;
    }
}