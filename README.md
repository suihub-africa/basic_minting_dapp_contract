
---

### 📁 `contracts/` — Move Smart Contract (NFT Logic)

```md
# 🔒 Smart Contract — basic_minting_dapp

This is the Move-based smart contract deployed on the **Sui Network**, which defines the logic for minting NFTs.

---

## 📦 Features

- 🧱 Minting NFTs with custom metadata
- 🎯 Ensures unique object IDs for each NFT
- 🔐 Permissionless access (or scoped access based on logic)

---

## 🧪 Structure

- `sources/`: Move module with NFT minting logic
- `Move.toml`: Package config file

---

## 🔁 How to Deploy & Test

```bash
# Make sure you have Sui CLI installed
sui move build
sui client publish
