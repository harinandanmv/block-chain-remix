// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HashcashPOW {

    uint public difficulty;     // number of leading zeros required
    bytes32 public finalHash;   // resulting valid hash
    uint public finalNonce;     // winning nonce

    constructor(uint _difficulty) {
        difficulty = _difficulty;
    }

    // 1) Set target difficulty
    function setDifficulty(uint _difficulty) public {
        difficulty = _difficulty;
    }

    // 2) Count leading zeros in hash
    function countLeadingZeros(bytes32 hashValue) public pure returns (uint) {
        uint zeros = 0;

        for (uint i = 0; i < 32; i++) {
            bytes1 b = hashValue[i];

            if (b == 0x00) {
                zeros += 2; // whole byte = 2 hex zeros
            } else {
                if (uint8(b) >> 4 == 0) {
                    zeros += 1;
                }
                break;
            }
        }

        return zeros;
    }

    // 3) Check if hash has required difficulty
    function hasRequiredDifficulty(bytes32 hashValue) public view returns (bool) {
        return countLeadingZeros(hashValue) >= difficulty;
    }

    // 4) Mine: find nonce that satisfies difficulty
    function mine(string memory data) public {
        uint nonce = 0;

        while (true) {
            bytes32 hashValue = keccak256(abi.encodePacked(data, nonce));

            if (hasRequiredDifficulty(hashValue)) {
                finalNonce = nonce;
                finalHash = hashValue;
                break;
            }

            nonce++;
        }
    }
}
