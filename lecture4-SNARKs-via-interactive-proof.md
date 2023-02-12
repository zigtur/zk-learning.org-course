# SNARKs via Interactive Proofs
Lecturer: Justin Thaler

## Recall
### What is a SNARK?

**SNARK**: a succint proof that a certain statement is true (example: I know a message $m$ such that $SHA256(m) = 0$)

So, the proof is **"short"** and **"fast"** to verify.

## Interactive Proofs: Motivation and Model

- $P$ solves the problem and tells $V$ the answer
  - Then they have a conversation
  - $P$'s goal: convince $V$ that the answer is correct
- Requirements:
  - 1 - Completeness: an honest $P$ can convince $V$ to accept
  - 2 - (Statistical) Soundness: $V$ will catch a lying $P$ with high probability. 
    - This must hold even if $P$ is computationally unbounded and trying to trick V into accepting the incorrect answer.
    - If soundness holds only against polynomial-time provers, then the protocol is called an interactive **argument**.


**Soundness** and **Knowledge soundess** are different:
  - **Sound**: $V$ accepts $\rightarrow$ There exists $w$ such that $C(x,w) = 0$
  - **Knowledge sound**: $V$ accepts \rightarrow $P$ "knows" $w$ such that $C(x,w) = 0$

Standard soundness is meaningful even in contexts where knowledge soundness isn't:
  - Because there's no natural "witness"
  - For example, $P$ claims the output of $V$'s program on $x$ is $42$.

Likewise, knowledge soundness is meaningful in contexts where standard isn't:
  - e.g. $P$ claims to know the secret key that controls a certain bitcoin wallet


### Public Verifiability
- Interactive proofs and arguments only convince the party that is choosing/sending the random challenges.
- This is bad if there are many verifiers (as in most blockchain applications)
  - becayse $P$ would have to convince each verifier separately
- For public coin protocols, we have a solution: Fiat-Shamir
  - Makes the protocol non-interactive + publicly verifiable


## SNARKs from interactive proofs: outline
Actual SNARK: $P$ commits cryptographically to $w$
  - Uses an IP to prove that $w$ satisfies the claimed property
  - Reveals just enough information about the committed witness $w$ to allow $V$ to run its checks in the IP
  - Render non-interactive via Fiat-Shamir

### Review of functional commitments
Note: see previous courses for more details
- Polynomial commitments
- Multilinear commitments
- Vector commitments (e.g. Merkle Trees)

### Merkle Trees
- Commitment to vector is root hash
- To open an entry of the committed vector (leaf of the tree):
  - Send sibling hashes of all nodes on root-to-leaf path
  - $V$ checks these are consistent with the root hash
  - "Opening proof" size is $O(log(n))$ hash values

### Summary: commit to a univariate $f(X)$ in $F^{(\leqslant{d})} [X]$
- $P$ Merkle-commits to all evaluations of the polynomial $f$
- When $V$ requests $f(r)$, $P$ reveals the associated leaf along with opening information
- Two problems:
  - 1. The number of leaves is $|F|$, which means the time to compute the commitment is at least $|F|$
    - Big problem when working over large fields (say, $|F| \approx 2^{64}$ or $|F| \approx 2^{128}$)
    - Want time proportional to the degree bound $d$
  - 2. $V$ does not know if $f$ has degree at most $d$!
    - We'll explain how to address both issues later in the course




