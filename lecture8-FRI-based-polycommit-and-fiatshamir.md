# FRI-based Polynomial Commitments and Fiat-Shamir

Lecturer: Justin Thaler

## Recall
### Polynomial commitments: Three classes
- 1. Based on pairings + trusted setup (not transparent nor post-quantum)
  - KZG10 is an example (lecture 5 and 6)
  - Unique property: constant sized evaluation proofs
- 2. Based on discrete logarithm (transparent, not post-quantum)
  - Examples: IPA/Bulletproofs (Lecture 6), Hyrax, Dory
- 3. Based on IOPs + hashing (transparent and post-quantum)
  - e.g. FRI (covered in this lecture), Ligero, Brakedown, Orion

1 and 2 are homomorphic
  - Leads to efficient batching/amortization of $P$ and $V$ costs (for example when proving knowledge of several different witnesses).

### Some specimens from the zoo
- 1. [Any polynomial IOP] + IPA/Bulletproofs poly commitment
  - Ex: Halo2-ZCash
  - Pros: Shortest proofs among transparent SNARKs
  - Cons: Slow Verifier
- 2. [Any polynomial IOP] + FRI poly commitment
  - Ex: STARKs, Fractal, Aurora, Virgo, Ligero+++
  - Pros: Shortest proofs amongst plausibly PQ SNARKs
  - Cons: Proofs are large (100s of KiloBytes depending on security)
- 3. MIPs and IPs + [fast-prover polynomial commitments]
  - Ex: Spartan, Brakedown, Orion, Orion+
  - Pros: Fastest $P$ in literature, plausibly Post-Quantum + transparent if poly commit is
  - Cons: Bigger proofs than 1 and 2

### Non-transparent SNARKs
- 1. Linear-PCP based:
  - Ex: Groth16
  - Pros: Shortest proofs (3 group elements), fastest $V$
  - Cons: Circuit-specific trusted setup, slow and space-intensive $P$, not PQ
- 2. Constant-round polynomial IOP + KZG poly commit:
  - Ex: Marlin-KZG, PlonK-KZG
  - Pros: Universal trusted setup
  - Cons: Proofs are ~4-6x larger than Groth16, $P$ is slower than Groth16, not PQ
    - Counterpoint for $P$: can use more flexible intermediate representations than circuits and R1CS

## FRI (Univariate) Polynomial Commitment
### Recall
Univariate Poly Commitment:
- Let $q$ be a degree-(k-1) polynomial over field $\mathbb{F}_p$
  - E.g., $k=5$ and $q(X)=1+2X+4X^2+X^4$
- Want $P$ to succintly commit to $q$, later reveal $q(r)$ for an $r \in \mathbb{F}_p$ chosen by $V$
  - Along with associated "evalutation proof"

From lecture 4:
- $P$ merkle-commits to all evaluations of the polynomial $q$
- When $V$ requests $q(r)$, $P$ reveals the associated leaf along with opening information
- Two problems:
  - 1. Number of leaves is $|\mathbb{F}|$
    - Big problem when working over large fields
  - 2. $V$ does not know if $f$ has degree at most $k$!
  




