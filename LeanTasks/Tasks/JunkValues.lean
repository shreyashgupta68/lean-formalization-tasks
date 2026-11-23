import Mathlib.Algebra.Group.Nat.Even
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Inverse
import Mathlib.Data.ENNReal.Operations
import Mathlib.SetTheory.Cardinal.Finite

/-!
# Statement review tasks: Mathlib junk values

Mathlib functions are total. Outside its textbook domain a function returns a default
("junk") value, so a statement copied from a textbook can compile and still be false.

Each section below has three tasks:

* `*_value`: prove what Mathlib actually returns;
* `*_naive_false`: disprove the textbook-looking statement with a counterexample;
* the corrected statement, with the hypothesis that rules the junk case out.

Replace every `sorry`. Solutions are in `LeanTasks/Solutions/JunkValues.lean`.
-/

open Real

namespace LeanTasks.Tasks.JunkValues

/-! ## 1. Integer division is Euclidean -/

/-- On `ℤ`, `/` is Euclidean division: the remainder is never negative. -/
theorem int_div_value : (-7 : ℤ) / 2 = -4 := by
  sorry

/-- Hint: try `a = 1, b = 2`. -/
theorem int_div_mul_naive_false : ¬ ∀ a b : ℤ, b ≠ 0 → a / b * b = a := by
  sorry

theorem int_div_mul_of_dvd {a b : ℤ} (h : b ∣ a) : a / b * b = a := by
  sorry

/-! ## 2. Casting a natural-number quotient -/

/-- The division happens in `ℕ` first, and only then is the result cast to `ℝ`. -/
theorem nat_div_cast_value : ((7 / 2 : ℕ) : ℝ) = 3 := by
  sorry

theorem nat_div_cast_naive_false : ¬ ∀ n : ℕ, ((n / 2 : ℕ) : ℝ) = (n : ℝ) / 2 := by
  sorry

/-- Hint: `obtain ⟨k, rfl⟩ := hn`, then `omega` for the `ℕ` part and `push_cast`. -/
theorem nat_div_cast_of_even {n : ℕ} (hn : Even n) : ((n / 2 : ℕ) : ℝ) = (n : ℝ) / 2 := by
  sorry

/-! ## 3. `Int.toNat` sends negatives to `0` -/

theorem int_toNat_value : Int.toNat (-5) = 0 := by
  sorry

theorem int_toNat_naive_false : ¬ ∀ z : ℤ, (z.toNat : ℤ) = z := by
  sorry

theorem int_toNat_of_nonneg {z : ℤ} (hz : 0 ≤ z) : (z.toNat : ℤ) = z := by
  sorry

/-! ## 4. `Fin n` subtraction wraps around -/

theorem fin_sub_value : (2 : Fin 5) - 3 = 4 := by
  sorry

theorem fin_sub_le_naive_false : ¬ ∀ a b : Fin 5, a - b ≤ a := by
  sorry

/-- Hint: a statement about every element of a finite type can be checked by `decide`. -/
theorem fin_sub_val_of_le : ∀ a b : Fin 5, b ≤ a → ((a - b : Fin 5) : ℕ) = (a : ℕ) - (b : ℕ) := by
  sorry

/-! ## 5. `ENNReal`: `⊤ - ⊤ = 0` -/

theorem ennreal_top_sub_top : (⊤ : ENNReal) - ⊤ = 0 := by
  sorry

/-- Hint: one of the two values should be `⊤`. -/
theorem ennreal_add_sub_naive_false : ¬ ∀ a b : ENNReal, a + b - b = a := by
  sorry

theorem ennreal_add_sub_cancel {a b : ENNReal} (hb : b ≠ ⊤) : a + b - b = a := by
  sorry

/-! ## 6. `Nat.card` of an infinite type is `0` -/

theorem nat_card_nat : Nat.card ℕ = 0 := by
  sorry

theorem nat_card_pos_naive_false : ¬ ∀ (α : Type) [Nonempty α], 0 < Nat.card α := by
  sorry

theorem nat_card_pos_of_finite (α : Type) [Nonempty α] [Finite α] : 0 < Nat.card α := by
  sorry

/-! ## 7. `Nat.gcd 0 0 = 0` -/

theorem nat_gcd_zero_zero : Nat.gcd 0 0 = 0 := by
  sorry

theorem nat_gcd_pos_naive_false : ¬ ∀ a b : ℕ, 0 < Nat.gcd a b := by
  sorry

theorem nat_gcd_pos_of_pos_left {a : ℕ} (b : ℕ) (ha : 0 < a) : 0 < Nat.gcd a b := by
  sorry

/-! ## 8. `Real.arcsin` is clamped outside `[-1, 1]` -/

theorem arcsin_two : arcsin 2 = π / 2 := by
  sorry

theorem sin_arcsin_naive_false : ¬ ∀ x : ℝ, sin (arcsin x) = x := by
  sorry

theorem sin_arcsin_of_mem {x : ℝ} (h₁ : -1 ≤ x) (h₂ : x ≤ 1) : sin (arcsin x) = x := by
  sorry

/-! ## 9. `Real.Gamma` is `0` at the non-positive integers -/

/-- Hint: `Real.Gamma_neg_nat_eq_zero`, then clean up the cast. -/
theorem gamma_neg_one : Gamma (-1) = 0 := by
  sorry

theorem gamma_ne_zero_naive_false : ¬ ∀ x : ℝ, Gamma x ≠ 0 := by
  sorry

theorem gamma_ne_zero_of_pos {x : ℝ} (hx : 0 < x) : Gamma x ≠ 0 := by
  sorry

end LeanTasks.Tasks.JunkValues
