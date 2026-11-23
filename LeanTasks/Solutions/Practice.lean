import Mathlib.Analysis.PSeries
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Nat.Prime.Infinite
import Mathlib.NumberTheory.Divisors
import Mathlib.Topology.Order.Compact

/-!
# Practice tasks: solutions

Worked solutions for `LeanTasks/Tasks/Practice.lean`. Every proof is complete and uses only
the standard axioms (`propext`, `Classical.choice`, `Quot.sound`).
-/

open Real Finset

namespace LeanTasks.Solutions.Practice

theorem sum_odd (n : ℕ) : ∑ i ∈ range n, (2 * i + 1) = n ^ 2 := by
  induction n with
  | zero => simp
  | succ k ih =>
    rw [sum_range_succ, ih]
    ring

theorem sub_one_add_one_naive_false : ¬ ∀ n : ℕ, n - 1 + 1 = n := by
  intro h
  have := h 0
  omega

theorem even_mul_succ (n : ℕ) : Even (n * (n + 1)) :=
  Nat.even_mul_succ_self n

theorem exists_prime_ge (N : ℕ) : ∃ p, N ≤ p ∧ p.Prime :=
  Nat.exists_infinite_primes N

theorem bounded_on_Icc (f : ℝ → ℝ) (hf : ContinuousOn f (Set.Icc 0 1)) :
    ∃ M, ∀ x ∈ Set.Icc (0 : ℝ) 1, |f x| ≤ M := by
  obtain ⟨M, hM⟩ := isCompact_Icc.exists_bound_of_continuousOn hf
  exact ⟨M, fun x hx => by simpa using hM x hx⟩

def IsPerfect (n : ℕ) : Prop := ∑ i ∈ n.properDivisors, i = n

theorem isPerfect_28 : IsPerfect 28 := by
  unfold IsPerfect
  decide

/-- No hypothesis is needed because of junk values: for `x < 0`, `Real.log x = Real.log |x|`,
and `Real.log 0 = 0`, so both sides agree for every real `x`. -/
theorem log_sq (x : ℝ) : Real.log (x ^ 2) = 2 * Real.log x := by
  rw [Real.log_pow]
  norm_num

theorem even_add_even (a b : ℕ) (ha : Even a) (hb : Even b) : Even (a + b) :=
  ha.add hb

end LeanTasks.Solutions.Practice
