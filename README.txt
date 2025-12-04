# Blockchain in Remix IDE 🚀

Simple blockchain prototype built with Solidity and executed in Remix IDE. Demonstrates blocks, hashing, and Proof of Work.

---

## ✨ Features
- Add blocks with custom data
- Validate chain integrity
- Generate hashes with keccak256
- Mine blocks using nonce and difficulty
- Track index, timestamp, data, previous hash, hash, nonce

---

## 🛠️ Tech Stack
- Solidity
- Remix IDE
- JavaScript and TypeScript scripts
- Mocha and Chai tests

---

## 📂 Project Structure
- **contracts** — Solidity contracts
- **scripts** — deployment scripts
- **tests** — unit tests
- **artifacts** — compiled build output

---

## ⚙️ Setup
```bash
git clone https://github.com/harinandanmv/block-chain-remix.git
```
- Import folder into Remix file explorer
- Open the main contract in `contracts`
- Select the correct Solidity compiler version

---

## ▶️ How to Use
- Open Remix IDE
- Import project files
- Compile the contract
- Deploy using JavaScript VM
- Call functions to mine blocks and inspect values

---

## 🧱 Block Structure
Each block stores:
- Index
- Timestamp
- Data
- Previous Hash
- Hash
- Nonce
- Difficulty

---

## 🔄 Workflow
1. Create Genesis block
2. Add data and mine new block
3. Proof of Work adjusts nonce until hash meets difficulty
4. Block added after validation
5. Chain checked for consistency

---

## 💡 Key Functions
- `createGenesisBlock()` — generates first block
- `addBlock()` — adds a new block
- `mineBlock()` — Proof of Work loop
- `calculateHash()` — computes SHA3 hash
- `isChainValid()` — verifies the chain

---

## 📦 Blockchain Properties
- Immutable linked records
- Sequential ordering
- Hash-based security
- Tamper detection

---

## 🖥️ Example Output
After mining a block:
- Hash begins with required leading zeros
- Nonce increases until match achieved
- Chain expands in sequence

---

## 🎯 Example Use Cases
- Learning blockchain fundamentals
- Academic presentation
- Proof of Work experimentation

---

## 🤝 Contributor
**M V Harinandan**

---

## 📜 License
Educational open use
