#!/usr/bin/env node
import { Command } from "commander";
import { createBnBClient } from "../core/client.js";

const program = new Command();

program.command("ping").action(async () => {
  const client = createBnBClient();
  console.log(await client.getBlockNumber());
});

program.parse();
