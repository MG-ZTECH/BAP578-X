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
