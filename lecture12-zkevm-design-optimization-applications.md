# zkEVM Design, Optimization and Applications

Lecturer: Ye Zhang (Scroll)


## Background & motivation

Layer2 will store data and proofs on Layer1.

zkEVM can prove several transactions, and 

zkEVM did become famous in the last 2 years, thanks to:
- Polynomial commitment
- Lookup + Custom gate
- Hardware acceleration
- Recursive proof

### Mutliple types of zkEVM
- Language level: Transpile an EVM-friendly language (Solidity and Yul) to a SNARK-friendly VM which differs from the EVM. This is the approach of Matter Labs (zkSync ERA) and Starkware.
- Bytecode level: Interpret EVM bytecode directly, though potentially producing different state roots than the EVM, e.g. if certain implementation-level data structures are replace with SNARK-friendly alternatives. Approach taken by Scrol, Hermez and Consensys.
- Consensus level: Target full equivalence with EVM as used by Ethereum L1 consensus. That is, it proves validity of L1 Ethereum state roots. Part of the "zk-SNARK everything" roadmap for Ethereum.

## Build a zkEVM from scratch

Program ==> Constraints ==> Proofs

Constraints: R1CS, Plonkish, AIR
Proof: Polynomial IOP + PCS

Here Program would be EVM itself.

Scroll does use Plonkish as constraints and Plonk IOP + KZG Poly scheme.


## Interesting research problems



## Other applications using zkEVM



