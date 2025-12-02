// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBlockchain {

    struct Transaction {
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
    }

    struct BlockStruct {
        uint256 index;
        uint256 timestamp;
        Transaction[] transactions;
        bytes32 prevHash;
        bytes32 hash;
    }

    mapping(uint256 => BlockStruct) public blocks;
    uint256 public latestIndex;

    Transaction[] public pendingTx;

    event BlockAdded(uint256 index, bytes32 hash);
    event TransactionAdded(address sender, address receiver, uint256 amount);

    constructor() {
        _addBlock();
    }

    function _addBlock() internal returns (uint256) {
        uint256 index = latestIndex + 1;
        uint256 ts = block.timestamp;

        bytes32 prevHash = blocks[latestIndex].hash;

        bytes32 h = keccak256(
            abi.encodePacked(index, ts, prevHash, pendingTx.length)
        );

        BlockStruct storage newBlock = blocks[index];
        newBlock.index = index;
        newBlock.timestamp = ts;
        newBlock.prevHash = prevHash;
        newBlock.hash = h;

        for (uint i = 0; i < pendingTx.length; i++) {
            newBlock.transactions.push(pendingTx[i]);
        }

        delete pendingTx;
        latestIndex = index;

        emit BlockAdded(index, h);
        return index;
    }

    function addTransaction(address receiver, uint256 amount) external {
        Transaction memory txObj = Transaction({
            sender: msg.sender,
            receiver: receiver,
            amount: amount,
            timestamp: block.timestamp
        });

        pendingTx.push(txObj);

        emit TransactionAdded(msg.sender, receiver, amount);
    }

    function mineBlock() external returns (uint256) {
        require(pendingTx.length > 0, "No pending transactions");
        return _addBlock();
    }

    function getBlock(uint256 index) external view returns (
        uint256, uint256, bytes32, bytes32, uint256
    ) {
        BlockStruct storage b = blocks[index];
        return (
            b.index,
            b.timestamp,
            b.prevHash,
            b.hash,
            b.transactions.length
        );
    }

    function getTransaction(
        uint256 blockIndex,
        uint256 txIndex
    ) external view returns (
        address, address, uint256, uint256
    ) {
        Transaction storage t = blocks[blockIndex].transactions[txIndex];
        return (t.sender, t.receiver, t.amount, t.timestamp);
    }

    function chainLength() external view returns (uint256) {
        return latestIndex;
    }
}
