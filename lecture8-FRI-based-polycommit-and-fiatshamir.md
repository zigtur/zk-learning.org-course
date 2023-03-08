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

