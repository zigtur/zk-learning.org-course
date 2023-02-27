# Polynomial Commitments based on Pairing and Discrete Logarithm
Lecturer: Yupeng Zhang

## Recall
### An efficient SNARK
Polynomial Commitment scheme + Polynomial Interactive Oracle Proof (IOP) $\Rightarrow$ SNARK for general circuits

## Plonk
Univariate Polynomial Commitment + Plonk Polynomial IOP $\Rightarrow$ SNARK for general circuits

### Interactive proofs
Multivariate polynomial commitment + Sumcheck protocol $\Rightarrow$ SNARK for general circuits

### What is a polynomial commitment
First, we need to choose a family of polynomials $\mathbb{F}$
```mermaid
sequenceDiagram
    actor Prover
    Prover ->> Prover: f(x) in F
    Prover ->> Verifier: commit(f) -> com_f
    Verifier -->> Prover: u
    Prover ->> Verifier: v, proof pi
    Verifier -->> Verifier: accept OR reject
```
With pi a proof that $f(u) = v$ and $f \in \mathbb{F}$.



