#!/bin/bash

mkdir -p src/cli src/core src/bap578 src/ops src/indexer

cat > package.json << 'PKG'
{
  "name": "bap578-x",
  "version": "0.2.0",
  "description": "BNB-native Ops Kit for BAP-578 Non-Fungible Agents",
  "type": "module",
  "bin": { "bap578-x": "dist/cli/main.js" },
  "main": "dist/index.js",
  "scripts": {
    "dev": "node --loader ts-node/esm src/cli/main.ts",
    "build": "tsup src/index.ts src/cli/main.ts --format esm --dts --out-dir dist",
    "typecheck": "tsc -p tsconfig.json --noEmit"
  },
  "dependencies": {
    "commander": "^12.0.0",
    "dotenv": "^16.4.0",
    "zod": "^3.24.0",
    "viem": "^2.21.0",
    "pino": "^9.0.0"
  },
  "devDependencies": {
    "ts-node": "^10.9.2",
    "tsup": "^8.0.0",
    "typescript": "^5.4.0"
  }
}
PKG

cat > tsconfig.json << 'TS'
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "Node",
    "strict": true,
    "outDir": "dist",
    "esModuleInterop": true,
    "skipLibCheck": true
  }
}
TS

cat > README.md << 'README'
# BAP578-X

## BNB-Native Ops Kit for Non-Fungible Agents

BAP578-X is an operational toolkit for BAP-578 agents on BNB Chain.

### Features
- BSC / opBNB presets
- Metadata compiler
- Gas snapshot
- Multicall batch reader
- Local event indexer

### Usage

npx bap578-x ping --chain bsc
npx bap578-x gas --chain bsc
README

cat > src/index.ts << 'INDEX'
export { createBnBClient } from "./core/client.js";
export { compileMetadata } from "./bap578/metadata.js";
INDEX

cat > src/core/client.ts << 'CLIENT'
import { createPublicClient, http } from "viem";
import { bsc } from "viem/chains";

export function createBnBClient() {
  const publicClient = createPublicClient({
    chain: bsc,
    transport: http()
  });

  return {
    async getBlockNumber() {
      return publicClient.getBlockNumber();
    }
  };
}
CLIENT

cat > src/bap578/metadata.ts << 'META'
import { z } from "zod";
import { keccak256, toHex } from "viem";

const Schema = z.object({
  persona: z.any(),
  experience: z.string(),
  animationURI: z.string().url(),
  vaultURI: z.string().url(),
  vaultHash: z.string()
});

export function compileMetadata(input: any) {
  const parsed = Schema.parse(input);
  const personaStr = JSON.stringify(parsed.persona);
  const personaHash = keccak256(toHex(personaStr));

  return {
    ...parsed,
    personaHash
  };
}
META

cat > src/cli/main.ts << 'CLI'
#!/usr/bin/env node
import { Command } from "commander";
import { createBnBClient } from "../core/client.js";

const program = new Command();

program.command("ping").action(async () => {
  const client = createBnBClient();
  console.log(await client.getBlockNumber());
});

program.parse();
CLI

chmod +x src/cli/main.ts

echo "Project created."
