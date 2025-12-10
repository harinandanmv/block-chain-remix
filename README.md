# 🚀 Blockchain in Remix IDE

Simple blockchain prototype built with Solidity, running in Remix IDE. It demonstrates core blockchain building blocks: blocks, hashing, and Proof of Work mining. The repo helps you learn how a basic blockchain works under the hood.

---

## ✨ Features

- Add blocks with custom data  
- Validate chain integrity  
- Generate hashes using keccak256  
- Mine blocks using nonce and difficulty  
- Track block index, timestamp, data, previous hash, hash, nonce  

---

## 🛠 Tech Stack

- Solidity  
- Remix IDE  
- JavaScript / TypeScript for deployment scripts  
- Mocha & Chai for unit tests  

---

## 📂 Project Structure

- **contracts** — Solidity smart contracts  
- **scripts** — deployment scripts  
- **tests** — unit test files  
- **artifacts** — compiled output  

---

## ⚙️ Setup

```bash
git clone https://github.com/harinandanmv/block-chain-remix.git
```

Then:  
1. Open Remix IDE  
2. Import project folder  
3. Open smart contract file in `contracts`  
4. Select proper Solidity compiler version  

---

## ▶️ Usage

1. In Remix, compile the contract  
2. Deploy using JavaScript VM environment  
3. Use contract functions to create genesis block, add data, mine blocks, or validate chain  

---

## 🧱 Block Structure

Each block includes:

- Index  
- Timestamp  
- Data  
- Previous Hash  
- Hash  
- Nonce  
- Difficulty  

---

## 🔄 Workflow

1. Create the genesis block  
2. Add custom data and mine the block  
3. Proof of Work loops until the hash meets difficulty  
4. New block is added to the chain  
5. Chain validity can be verified  

---

## 💡 Key Functions

- `createGenesisBlock()` — generate first block  
- `addBlock()` — append a new block to chain  
- `mineBlock()` — perform Proof of Work mining  
- `calculateHash()` — compute block hash  
- `isChainValid()` — check chain integrity  

---

## 📦 Blockchain Properties

- Immutable linked blocks  
- Sequential block order  
- Hash-based security  
- Tamper detection and chain validation  

---

## 🖥 Example Output

After mining a block:

- Hash begins with required leading zeros  
- Nonce increments until valid hash found  
- Chain grows sequentially  

---

## 🎯 Use Cases

- Learn blockchain fundamentals  
- Demonstrate Proof of Work mechanism  
- Educational or academic purposes  

---

## 👤 Author

**M V Harinandan**  
📩 harinandanmv11@gmail.com  

---

## 📜 License

Use this project for learning and educational purposes  
