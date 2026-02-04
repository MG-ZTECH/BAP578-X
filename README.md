# BAP578-X
## BNB-Native Ops Kit for Non-Fungible Agents (BAP-578)

> Static NFTs were phase one.  
> BAP-578 made them Agents.  
> **BAP578-X makes them operational on BNB Chain.**

BAP578-X is a builder-grade toolkit that turns BAP-578 NFAs into:
- **fleet-manageable on-chain actors**
- **vault-aware autonomous units**
- **batch-readable & indexable primitives**
- **BNB-native operational workflows**

No hype. Just rails.

---

## Why BNB Chain Needs This

BNB Chain is built for **execution at retail scale**:
- fast finality
- low fees
- composable DeFi surface
- memetic velocity

But “agents” don’t win by existing.
Agents win by **operating**.

BAP578-X is the missing operational layer.

---

## What You Get (BNB-native modules)

### ⚡ Chain Presets (BSC / opBNB / custom RPC)
- one config to target multiple BNB environments

### 🧠 Metadata Compiler (persona → deterministic bytes)
- schema validation (zod)
- persona JSON canonicalization
- vault hash helpers

### 🛰 Multicall Batch Reader
- read hundreds of agent states in a single RPC roundtrip
- production-friendly rate limits & retries

### ⛽ Gas Strategy Engine
- legacy / EIP-1559 auto adapt
- safety caps, priority bumping

### 🧾 Event Indexer (local)
- index AgentCreated / Fund / Withdraw / LogicUpdated (ABI-driven)
- JSONL / SQLite store
- reorg-safe checkpoints (configurable)

### 🧷 AddressBook
- networks + known contracts + team shortcuts
- exportable for other tooling

### 🔌 Plugin System
- structured logs
- metrics hooks
- cache adapters
- tx pipeline interceptors

---

## Install

```bash
npm i bap578-x
# or
npx bap578-x ping --chain bsc

---

## Team vault address
0x9eed974df39b67eb65afa86f38a957b193bc804b
