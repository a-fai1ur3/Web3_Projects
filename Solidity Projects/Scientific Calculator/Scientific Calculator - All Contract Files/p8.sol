// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StatisticalFunctions {
        // Calculate the mean of an array of numbers
        function calculateMean(uint256[] memory numbers) public pure returns (uint256) {
            require(numbers.length > 0, "Empty array.");
            uint256 sum = 0;
            for (uint256 i = 0; i < numbers.length; i++) {
                sum += numbers[i];
            }
            return sum / numbers.length;
        }

        // Calculate the median of an array of numbers
        function calculateMedian(uint256[] memory numbers) public pure returns (uint256) {
            require(numbers.length > 0, "Empty array.");
            uint256[] memory sortedNumbers = _sortArray(numbers);
            uint256 middle = sortedNumbers.length / 2;
            if (sortedNumbers.length % 2 == 0) {
                // If even number of elements, average the middle two
                return (sortedNumbers[middle - 1] + sortedNumbers[middle]) / 2;
            } else {
                // If odd number of elements, return the middle element
                return sortedNumbers[middle];
            }
        }

        // Calculate the mode of an array of numbers
        function calculateMode(uint256[] memory numbers) public pure returns (uint256) {
            require(numbers.length > 0, "Empty array.");
            mapping(uint256 => uint256) count;
            uint256 maxCount = 0;
            uint256 mode = 0;
            for (uint256 i = 0; i < numbers.length; i++) {
                count[numbers[i]]++;
                if (count[numbers[i]] > maxCount) {
                    maxCount = count[numbers[i]];
                    mode = numbers[i];
                }
            }
            return mode;
        }

        // Calculate the standard deviation of an array of numbers
        function calculateStandardDeviation(uint256[] memory numbers) public pure returns (uint256) {
            require(numbers.length > 0, "Empty array.");
            uint256 mean = calculateMean(numbers);
            uint256 sumOfSquaredDifferences = 0;
            for (uint256 i = 0; i < numbers.length; i++) {
                int256 difference = int256(numbers[i]) - int256(mean);
                sumOfSquaredDifferences += uint256(difference * difference);
            }
            uint256 variance = sumOfSquaredDifferences / numbers.length;
            return squareroot(variance);
        }

        // Calculate the variance of an array of numbers
        function Variance(uint256[] memory numbers) public pure returns (uint256) {
            require(numbers.length > 0, "Empty array.");
            uint256 mean = calculateMean(numbers);
            uint256 sumOfSquaredDifferences = 0;
            for (uint256 i = 0; i < numbers.length; i++) {
                int256 difference = int256(numbers[i]) - int256(mean);
                sumOfSquaredDifferences += uint256(difference * difference);
            }
            return sumOfSquaredDifferences / numbers.length;
        }

        // Internal function to sort an array
        function _sortArray(uint256[] memory arr) internal pure returns (uint256[] memory) {
            for (uint256 i = 0; i < arr.length; i++) {
                for (uint256 j = i + 1; j < arr.length; j++) {
                    if (arr[i] > arr[j]) {
                        uint256 temp = arr[i];
                        arr[i] = arr[j];
                        arr[j] = temp;
                    }
                }
            }
            return arr;
        }
}