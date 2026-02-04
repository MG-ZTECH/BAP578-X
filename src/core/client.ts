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
