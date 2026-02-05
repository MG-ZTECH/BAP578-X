import type { PublicClient } from "viem";

export async function gasSnapshot(client: PublicClient) {
  const block = await client.getBlock({ blockTag: "latest" });
  // baseFeePerGas is undefined on legacy-only chains; BSC is EIP-1559 capable in many RPCs.
  return {
    number: block.number,
    baseFeePerGas: block.baseFeePerGas ?? null,
    gasLimit: block.gasLimit
  };
}
