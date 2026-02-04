# Architecture Overview

BAP578-X follows a layered architecture:

CLI Layer
↓
SDK Core Layer
↓
Ops Modules
↓
Chain Transport (viem)
↓
BNB Chain

---

## Core Components

### 1. Chain Layer
Abstracts BSC / opBNB / custom RPC environments.

### 2. Metadata Compiler
Ensures deterministic persona hashing and validation.

### 3. Ops Layer
Gas engine, multicall batching, simulation helpers.

### 4. Indexer
Lightweight event scanner for agent lifecycle reconstruction.

---

Design Principles:

- Deterministic execution
- Minimal RPC roundtrips
- Extensibility-first
- BNB-native optimization
- No speculative token logic
