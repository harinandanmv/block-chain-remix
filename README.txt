# Blockchain in Remix IDE 🚀

Simple blockchain prototype built with Solidity and executed in Remix IDE. Demonstrates blocks, hashing, and Proof of Work.

## Features ✨

* Add blocks with custom data
* Validate chain integrity
* Generate hashes with keccak256
* Mine blocks using nonce and difficulty
* Track index, timestamp, data, previous hash, hash, nonce

## Tech Stack 🛠️

* Solidity
* Remix IDE
* JavaScript and TypeScript scripts
* Mocha and Chai tests

## Project Structure 📂

* **contracts**: Solidity contracts
* **scripts**: deploy scripts
* **tests**: unit tests
* **artifacts**: compiled build output

## Setup ⚙️

* Clone or download this repo
* Import folder into Remix file explorer
* Open contracts and select main Solidity file
* Choose proper compiler version

## How to Use ▶️

* Open Remix IDE
* Import project files
* Compile the smart contract
* Deploy using JavaScript VM
* Call functions to mine blocks and inspect values

## Block Structure 🧱

Each block stores:

* Index
* Timestamp
* Data
* Previous Hash
* Hash
* Nonce
* Difficulty

## Workflow 🔄

* Create Genesis block
* Add data and mine new block
* Proof of Work adjusts nonce until valid hash is found
* Block added after validation
* Entire chain checked for consistency

## Key Functions 💡

* createGenesisBlock: generate first block
* addBlock: add new block to chain
* mineBlock: Proof of Work mining loop
* calculateHash: compute SHA3 hash of block data
* isChainValid: verify chain consistency

## Blockchain Properties 📦

* Immutable linked data
* Sequential block order
* Hash based security
* Tamper detection

## Example Output 🖥️

After mining a block:

* Hash begins with required leading zeros
* Nonce increases until match achieved
* Chain grows sequentially

## Example Use Cases 🎯

* Learning blockchain fundamentals
* Academic demonstration
* Experimenting with Proof of Work

## Contributors 🤝

* Harinandan M V

## License 📜

Open educational usage
