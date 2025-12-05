// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleDAGWithPoW {
    // Difficulty = number of leading zero nibbles (hex digits) required
    uint public difficulty;

    // Node structure = "transaction node" in the DAG
    struct Node {
        uint id;             // node id
        address sender;      // tx sender
        address receiver;    // tx receiver
        uint amount;         // tx amount
        uint timestamp;      // when node was added
        uint parentId;       // parent node id (forms a DAG/chain)
        bytes32 hash;        // node hash that passed proof of work
    }

    // Store nodes
    mapping(uint => Node) public nodes;
    uint public nodeCount;

    event NodeAdded(
        uint indexed id,
        uint indexed parentId,
        address sender,
        address receiver,
        uint amount,
        bytes32 hash
    );

    constructor(uint _difficulty) {
        // Set initial difficulty
        difficulty = _difficulty;

        // Create genesis node (id = 0) with no parent
        bytes32 genesisHash = keccak256(abi.encodePacked("GENESIS"));
        nodes[0] = Node({
            id: 0,
            sender: address(0),
            receiver: address(0),
            amount: 0,
            timestamp: block.timestamp,
            parentId: 0,
            hash: genesisHash
        });
        nodeCount = 1;
    }

    // Allow difficulty change if needed
    function setDifficulty(uint _difficulty) public {
        difficulty = _difficulty;
    }

    // Count leading zero hex digits (nibbles) in a hash
    function countLeadingZeroNibbles(bytes32 hashValue)
        public
        pure
        returns (uint)
    {
        uint zeros = 0;

        for (uint i = 0; i < 32; i++) {
            bytes1 b = hashValue[i];

            // Full zero byte = two zero nibbles
            if (b == 0x00) {
                zeros += 2;
            } else {
                // Check high nibble
                if (uint8(b) >> 4 == 0) {
                    zeros += 1;
                }
                break;
            }
        }

        return zeros;
    }

    // Check if hash satisfies the difficulty
    function hasRequiredDifficulty(bytes32 hashValue)
        public
        view
        returns (bool)
    {
        return countLeadingZeroNibbles(hashValue) >= difficulty;
    }

    // "Memory-hard" style hash:
    // do repeated hashing in a loop to increase computation cost
    function memoryHardHash(
        address sender,
        address receiver,
        uint amount,
        bytes32 parentHash,
        uint nonce
    ) internal pure returns (bytes32) {
        // Base hash from transaction data
        bytes32 h = keccak256(
            abi.encodePacked(sender, receiver, amount, parentHash, nonce)
        );

        // Extra mixing rounds (simple simulated memory hard work)
        // Keep this loop small so it does not run out of gas
        for (uint i = 0; i < 32; i++) {
            h = keccak256(abi.encodePacked(h, i));
        }

        return h;
    }

    // Miner adds a new node
    // They choose parentId and nonce off-chain, then call this function
    function addNode(
        address receiver,
        uint amount,
        uint parentId,
        uint nonce
    ) public {
        require(parentId < nodeCount, "Invalid parent");

        Node storage parentNode = nodes[parentId];

        // Compute node hash using memoryHardHash
        bytes32 nodeHash = memoryHardHash(
            msg.sender,
            receiver,
            amount,
            parentNode.hash,
            nonce
        );

        // Only accept node if hash satisfies difficulty
        require(hasRequiredDifficulty(nodeHash), "Difficulty not met");

        // Store new node
        uint newId = nodeCount;
        nodes[newId] = Node({
            id: newId,
            sender: msg.sender,
            receiver: receiver,
            amount: amount,
            timestamp: block.timestamp,
            parentId: parentId,
            hash: nodeHash
        });

        nodeCount += 1;

        emit NodeAdded(
            newId,
            parentId,
            msg.sender,
            receiver,
            amount,
            nodeHash
        );
    }
}
