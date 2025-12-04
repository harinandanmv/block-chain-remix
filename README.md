
# 🚀 Blockchain in Remix IDE

This repository contains a simple blockchain prototype implemented in Solidity and tested in Remix IDE. It demonstrates the core structure of a blockchain including blocks, hashing, and Proof of Work.

---

## ✨ Features

* Add blocks with custom data
* Validate chain integrity
* Generate hashes using keccak256
* Mine blocks using nonce and difficulty
* Track index, timestamp, data, previous hash, hash, nonce

---

## 🛠 Tech Stack

* Solidity
* Remix IDE
* JavaScript and TypeScript Scripts
* Mocha and Chai Tests

---

## 📂 Project Structure

* **contracts** — Solidity smart contracts
* **scripts** — deployment scripts
* **tests** — unit testing files
* **artifacts** — compiled contract output

---

## ⚙️ Setup

```bash
git clone https://github.com/harinandanmv/block-chain-remix.git
```

1. Open Remix IDE
2. Import the project folder
3. Open the contract file in `contracts`
4. Select required Solidity compiler version

---

## ▶️ How to Use

1. Import project into Remix
2. Compile the smart contract
3. Deploy using **JavaScript VM** environment
4. Run functions to create blocks and mine them

---

## 🧱 Block Structure

Each block contains:

* Index
* Timestamp
* Data
* Previous Hash
* Hash
* Nonce
* Difficulty

---

## 🔄 Workflow

1. Create Genesis block
2. Add data and mine the next block
3. Proof of Work adjusts nonce until valid hash is generated
4. Block is added to chain
5. Chain validity verified

---

## 💡 Key Functions

* `createGenesisBlock()` — generates first block
* `addBlock()` — appends block to chain
* `mineBlock()` — mining loop performing Proof of Work
* `calculateHash()` — calculates block hash
* `isChainValid()` — verifies the chain

---

## 📦 Blockchain Properties

* Immutable block structure
* Chronological ordering
* Hash based verification
* Tamper detection

---

## 🖥 Example Output

After mining a block:

* Hash begins with required leading zeros
* Nonce increments until valid hash found
* Chain grows sequentially

---

## 🎯 Use Cases

* Learn blockchain fundamentals
* Academic demonstrations
* Proof of Work experiments

---

## 👤 Author

**M V Harinandan**
📩 [harinandanmv11@gmail.com](mailto:harinandanmv11@gmail.com)

---

## 📜 License

This repository is for educational and learning purposes.


