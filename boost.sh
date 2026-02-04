#!/bin/bash
set -e

mkdir -p .github/workflows .github/ISSUE_TEMPLATE docs examples abi

# Root docs
cat > ROADMAP.md << 'EOF'
# ROADMAP

## Phase 1 — Core Ops Layer
- Chain presets (BSC / opBNB)
- Metadata compiler
- Gas snapshot
- Multicall batch read
- CLI tools

## Phase 2 — Agent Intelligence Extensions
- Persona standardization
- Vault risk profiling scaffolds
- Plugin system expansion
- Simulation-first tx pipeline

## Phase 3 — Fleet Orchestration
- Batch agent operations
- Concurrency-safe job runner
- Reorg-aware indexer checkpoints

## Phase 4 — Ecosystem Integrations
- BscScan adapter (ABI fetch)
- NodeReal RPC adapter
- IPFS helpers
EOF

cat > DESIGN.md << 'EOF'
# DESIGN

BAP578-X is a developer-grade operational layer.

## Principles
1. Deterministic outputs
2. Minimal RPC roundtrips
3. BNB-native defaults
4. Extensibility-first (plugins)
5. Infra, not hype
EOF

cat > SECURITY.md << 'EOF'
# SECURITY

- Verify contract addresses before interacting.
- Prefer simulation before state changes.
- Do not commit private keys or secrets.
- Treat RPC providers as trust boundaries.

This toolkit does not custody user funds.
EOF

cat > CONTRIBUTING.md << 'EOF'
# CONTRIBUTING

## Setup
```bash
npm install
npm run build
