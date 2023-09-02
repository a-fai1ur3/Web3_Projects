// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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