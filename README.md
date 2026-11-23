# Lean formalization tasks

[![Lean build](https://github.com/shreyashgupta68/lean-formalization-tasks/actions/workflows/lean.yml/badge.svg)](https://github.com/shreyashgupta68/lean-formalization-tasks/actions/workflows/lean.yml)

Practice tasks for formalizing mathematics in Lean 4 with Mathlib. Each task is a theorem
statement with `sorry`; a matching file under `Solutions/` has a complete proof. CI compiles
both on every push and fails if a solution contains `sorry`.

Pinned versions: Lean `v4.33.0-rc1`, Mathlib
[`9944fe29`](https://github.com/leanprover-community/mathlib4/commit/9944fe2973b8dc0b86949101ed98232c07cd54a0).
Newer Mathlib may rename a lemma; if a name fails, search for it with
[Loogle](https://loogle.lean-lang.org) or `exact?`.

## The tasks

### `LeanTasks/Tasks/Practice.lean`: warm-up

| # | Statement | Skills |
|---|---|---|
| 1 | `∑ i ∈ range n, (2 * i + 1) = n ^ 2` | induction, `sum_range_succ`, `ring` |
| 2 | `¬ ∀ n : ℕ, n - 1 + 1 = n` | disproving a universal statement, `omega` |
| 3 | `Even (n * (n + 1))` | finding a Mathlib lemma |
| 4 | `∃ p, N ≤ p ∧ p.Prime` | finding a Mathlib lemma |
| 5 | a function continuous on `[0, 1]` is bounded there | statements with sets, compactness |
| 6 | `28` is perfect | writing your own definition, `decide` |
| 7 | `log (x ^ 2) = 2 * log x` for every real `x` | why no hypothesis is needed |
| 8 | the sum of two even numbers is even | term-mode proofs, dot notation |

### `LeanTasks/Tasks/JunkValues.lean`: statement review

Mathlib functions are total: outside the textbook domain they return a default ("junk")
value. A statement copied from a textbook can therefore compile and still be false. Each
section has three tasks: prove the junk value, disprove the naive statement with a
counterexample, then prove the corrected statement.

| Section | Junk value | Naive statement (false) | Fix |
|---|---|---|---|
| 1 | `(-7 : ℤ) / 2 = -4` | `b ≠ 0 → a / b * b = a` | `b ∣ a` |
| 2 | `((7 / 2 : ℕ) : ℝ) = 3` | `((n / 2 : ℕ) : ℝ) = n / 2` | `Even n` |
| 3 | `Int.toNat (-5) = 0` | `(z.toNat : ℤ) = z` | `0 ≤ z` |
| 4 | `(2 : Fin 5) - 3 = 4` | `a - b ≤ a` | `b ≤ a` |
| 5 | `(⊤ : ENNReal) - ⊤ = 0` | `a + b - b = a` | `b ≠ ⊤` |
| 6 | `Nat.card ℕ = 0` | `0 < Nat.card α` for nonempty `α` | `[Finite α]` |
| 7 | `Nat.gcd 0 0 = 0` | `0 < Nat.gcd a b` | `0 < a` |
| 8 | `arcsin 2 = π / 2` | `sin (arcsin x) = x` | `x ∈ [-1, 1]` |
| 9 | `Gamma (-1) = 0` | `Gamma x ≠ 0` | `0 < x` |

## How to work on a task

1. Say the statement in plain words: every variable, its type, every quantifier, where the
   casts are.
2. Check each function for junk values: what does it return outside its usual domain?
3. Sketch the proof with `have h : ... := by sorry` steps and compile after each one.
4. Fill in the steps. `exact?`, `apply?` and `rw?` suggest lemmas; remove them when done.
5. Finish with no `sorry`, no warnings, and `#print axioms your_theorem` showing only
   `propext`, `Classical.choice` and `Quot.sound`.

## Build locally

Install [elan](https://github.com/leanprover/elan), then:

```bash
git clone https://github.com/shreyashgupta68/lean-formalization-tasks.git
cd lean-formalization-tasks
lake exe cache get   # downloads prebuilt Mathlib files
lake build
```

`lake build` reports `declaration uses 'sorry'` for the task files; that is expected. The
solution files should build with no warnings.

No local setup? Paste a file into [live.lean-lang.org](https://live.lean-lang.org).

## Layout

```
LeanTasks/
  Tasks/Practice.lean        warm-up statements (sorry)
  Tasks/JunkValues.lean      statement review (sorry)
  Solutions/Practice.lean    complete proofs
  Solutions/JunkValues.lean  complete proofs
.github/workflows/lean.yml   CI: lake build + no-sorry check on Solutions
```
