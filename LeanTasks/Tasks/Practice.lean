import Mathlib.Analysis.PSeries
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Nat.Prime.Infinite
import Mathlib.NumberTheory.Divisors
import Mathlib.Topology.Order.Compact

/-!
# Practice tasks

Replace every `sorry` with a proof. Work in this order:

1. read the statement and say it in plain words (types, quantifiers, casts);
2. sketch the proof with `have h : ... := by sorry` steps and compile;
3. fill in each step; use `exact?`, `apply?` or Loogle to find lemma names;
4. remove any `exact?` before you finish.

Worked solutions are in `LeanTasks/Solutions/Practice.lean`. Try each task first.
-/

open Real Finset

namespace LeanTasks.Tasks.Practice

/-- Task 1. The sum of the first `n` odd numbers is `n ^ 2`.
Hint: induction on `n`, then `sum_range_succ`. -/
theorem sum_odd (n : ℕ) : ∑ i ∈ range n, (2 * i + 1) = n ^ 2 := by
  sorry

/-- Task 2. `n - 1 + 1 = n` is not a theorem on `ℕ`, because `0 - 1 = 0`.
Hint: specialise to `n = 0`, then `omega`. -/
theorem sub_one_add_one_naive_false : ¬ ∀ n : ℕ, n - 1 + 1 = n := by
  sorry

/-- Task 3. `n * (n + 1)` is even.
Hint: there is a Mathlib lemma with almost exactly this name. -/
theorem even_mul_succ (n : ℕ) : Even (n * (n + 1)) := by
  sorry

/-- Task 4. Above every `N` there is a prime. -/
theorem exists_prime_ge (N : ℕ) : ∃ p, N ≤ p ∧ p.Prime := by
  sorry

/-- Task 5. A function continuous on `[0, 1]` is bounded there.
Hint: `isCompact_Icc`, then a lemma about compact sets and `ContinuousOn`. -/
theorem bounded_on_Icc (f : ℝ → ℝ) (hf : ContinuousOn f (Set.Icc 0 1)) :
    ∃ M, ∀ x ∈ Set.Icc (0 : ℝ) 1, |f x| ≤ M := by
  sorry

/-- A natural number is perfect if it is the sum of its proper divisors. -/
def IsPerfect (n : ℕ) : Prop := ∑ i ∈ n.properDivisors, i = n

/-- Task 6. `28` is perfect. Hint: unfold the definition and let the kernel compute. -/
theorem isPerfect_28 : IsPerfect 28 := by
  sorry

/-- Task 7. `log (x ^ 2) = 2 * log x` for every real `x`, with no hypothesis.
Before proving it, explain why no `0 < x` is needed in Mathlib. -/
theorem log_sq (x : ℝ) : Real.log (x ^ 2) = 2 * Real.log x := by
  sorry

/-- Task 8. The sum of two even numbers is even. Try a one-line term proof. -/
theorem even_add_even (a b : ℕ) (ha : Even a) (hb : Even b) : Even (a + b) := by
  sorry

end LeanTasks.Tasks.Practice
