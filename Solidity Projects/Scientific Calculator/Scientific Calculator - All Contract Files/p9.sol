// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MatrixOperations {
    // Matrix addition
    function addMatrix(uint256[][] memory matrix1, uint256[][] memory matrix2) public pure returns (uint256[][] memory) {
        require(matrix1.length == matrix2.length, "Matrix dimensions must match.");
        require(matrix1[0].length == matrix2[0].length, "Matrix dimensions must match.");
        uint256 rows = matrix1.length;
        uint256 columns = matrix1[0].length;
        uint256[][] memory result = new uint256[][](rows);
        for (uint256 i = 0; i < rows; i++) {
            result[i] = new uint256[](columns);
            for (uint256 j = 0; j < columns; j++) {
                result[i][j] = matrix1[i][j] + matrix2[i][j];
            }
        }
        return result;
        }

        // Matrix subtraction
        function subtractMatrix(uint256[][] memory matrix1, uint256[][] memory matrix2) public pure returns (uint256[][] memory) {
            require(matrix1.length == matrix2.length, "Matrix dimensions must match.");
            require(matrix1[0].length == matrix2[0].length, "Matrix dimensions must match.");
            uint256 rows = matrix1.length;
            uint256 columns = matrix1[0].length;
            uint256[][] memory result = new uint256[][](rows);
            for (uint256 i = 0; i < rows; i++) {
                result[i] = new uint256[](columns);
                for (uint256 j = 0; j < columns; j++) {
                    result[i][j] = matrix1[i][j] - matrix2[i][j];
                }
            }
            return result;
        }

        // Matrix multiplication
        function multiplyMatrix(uint256[][] memory matrix1, uint256[][] memory matrix2) public pure returns (uint256[][] memory) {
            require(matrix1[0].length == matrix2.length, "Matrix dimensions mismatch for multiplication.");
            uint256 rows = matrix1.length;
            uint256 columns = matrix2[0].length;
            uint256 innerDimension = matrix1[0].length;
            uint256[][] memory result = new uint256[][](rows);
            for (uint256 i = 0; i < rows; i++) {
                result[i] = new uint256[](columns);
                for (uint256 j = 0; j < columns; j++) {
                    uint256 sum = 0;
                    for (uint256 k = 0; k < innerDimension; k++) {
                        sum += matrix1[i][k] * matrix2[k][j];
                    }
                    result[i][j] = sum;
                }
            }
            return result;
        }

        // Calculate the determinant of a matrix
        function calculateDeterminant(uint256[][] memory matrix) public pure returns (uint256) {
            uint256 n = matrix.length;
            require(n > 0, "Empty matrix.");
            require(matrix[0].length == n, "Matrix is not square.");
            if (n == 1) {
                return matrix[0][0];
            }
            if (n == 2) {
                return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
            }
            uint256 det = 0;
            for (uint256 i = 0; i < n; i++) {
                uint256[][] memory submatrix = new uint256[][](n - 1);
                for (uint256 j = 0; j < n - 1; j++) {
                    submatrix[j] = new uint256[](n - 1);
                }
                for (uint256 k = 1; k < n; k++) {
                    uint256 y = 0;
                    for (uint256 j = 0; j < n; j++) {
                        if (j == i) {
                            continue;
                        }
                        submatrix[k - 1][y] = matrix[k][j];
                        y++;
                    }
                }
                uint256 sign = i % 2 == 0 ? 1 : -1;
                det += sign * matrix[0][i] * calculateDeterminant(submatrix);
            }
            return det;
        }

        // Calculate the inverse of a matrix
        function calculateMatrixInverse(uint256[][] memory matrix) public pure returns (uint256[][] memory) {
            uint256 n = matrix.length;
            require(n > 0, "Empty matrix.");
            require(matrix[0].length == n, "Matrix is not square.");
            uint256 det = calculateDeterminant(matrix);
            require(det != 0, "Matrix is not invertible.");
            uint256[][] memory adjugate = new uint256[][](n);
            for (uint256 i = 0; i < n; i++) {
                adjugate[i] = new uint256[](n);
                for (uint256 j = 0; j < n; j++) {
                    uint256[][] memory submatrix = new uint256[][](n - 1);
                    for (uint256 k = 0; k < n - 1; k++) {
                        submatrix[k] = new uint256[](n - 1);
                    }
                    uint256 x = 0;
                    uint256 y = 0;
                    for (uint256 k = 0; k < n; k++) {
                        if (k == i) {
                            continue;
                        }
                        y = 0;
                        for (uint256 l = 0; l < n; l++) {
                            if (l == j) {
                                continue;
                            }
                            submatrix[x][y] = matrix[k][l];
                            y++;
                        }
                        x++;
                    }
                    uint256 sign = (i + j) % 2 == 0 ? 1 : -1;
                    adjugate[i][j] = sign * calculateDeterminant(submatrix);
                }
            }
            uint256[][] memory inverse = new uint256[][](n);
            for (uint256 i = 0; i < n; i++) {
                inverse[i] = new uint256[](n);
                for (uint256 j = 0; j < n; j++) {
                    inverse[i][j] = adjugate[j][i] / det;
                }
            }
            return inverse;
        }
}