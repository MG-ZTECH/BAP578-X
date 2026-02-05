import { keccak256, toHex } from "viem";
import { AgentMetadataSchema, type AgentMetadataInput } from "./schema.js";

function canonicalJson(obj: unknown) {
  const sorter = (v: any): any => {
    if (Array.isArray(v)) return v.map(sorter);
    if (v && typeof v === "object") {
      return Object.keys(v).sort().reduce((acc: any, k) => {
        acc[k] = sorter(v[k]);
        return acc;
      }, {});
    }
    return v;
  };
  return JSON.stringify(sorter(obj));
}

export function compileMetadata(input: AgentMetadataInput) {
  const parsed = AgentMetadataSchema.parse(input);

  const personaStr =
    typeof parsed.persona === "string" ? parsed.persona : canonicalJson(parsed.persona);

  const vaultHash = parsed.vaultHash;

  const personaHash = keccak256(toHex(personaStr));

  return {
    persona: personaStr,
    personaHash,
    experience: parsed.experience,
    animationURI: parsed.animationURI,
    vaultURI: parsed.vaultURI,
    vaultHash
  };
}
