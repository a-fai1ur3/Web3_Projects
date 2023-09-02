// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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