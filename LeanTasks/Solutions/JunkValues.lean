import Mathlib.Algebra.Group.Nat.Even
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Inverse
import Mathlib.Data.ENNReal.Operations
import Mathlib.SetTheory.Cardinal.Finite

/-!
# Statement review tasks: solutions

Worked solutions for `LeanTasks/Tasks/JunkValues.lean`. Every proof is complete and uses only
the standard axioms (`propext`, `Classical.choice`, `Quot.sound`).
-/

open Real

namespace LeanTasks.Solutions.JunkValues

/-! ## 1. Integer division is Euclidean -/

theorem int_div_value : (-7 : ℤ) / 2 = -4 := by
  decide

theorem int_div_mul_naive_false : ¬ ∀ a b : ℤ, b ≠ 0 → a / b * b = a := by
  intro h
  have := h 1 2 (by norm_num)
  omega

theorem int_div_mul_of_dvd {a b : ℤ} (h : b ∣ a) : a / b * b = a :=
  Int.ediv_mul_cancel h

/-! ## 2. Casting a natural-number quotient -/

theorem nat_div_cast_value : ((7 / 2 : ℕ) : ℝ) = 3 := by
  norm_num

theorem nat_div_cast_naive_false : ¬ ∀ n : ℕ, ((n / 2 : ℕ) : ℝ) = (n : ℝ) / 2 := by
  intro h
  have := h 1
  norm_num at this

theorem nat_div_cast_of_even {n : ℕ} (hn : Even n) : ((n / 2 : ℕ) : ℝ) = (n : ℝ) / 2 := by
  obtain ⟨k, rfl⟩ := hn
  have hk : (k + k) / 2 = k := by omega
  rw [hk]
  push_cast
  ring

/-! ## 3. `Int.toNat` sends negatives to `0` -/

theorem int_toNat_value : Int.toNat (-5) = 0 := by
  decide

theorem int_toNat_naive_false : ¬ ∀ z : ℤ, (z.toNat : ℤ) = z :=
  fun h => absurd (h (-1)) (by decide)

theorem int_toNat_of_nonneg {z : ℤ} (hz : 0 ≤ z) : (z.toNat : ℤ) = z :=
  Int.toNat_of_nonneg hz

/-! ## 4. `Fin n` subtraction wraps around -/

theorem fin_sub_value : (2 : Fin 5) - 3 = 4 := by
  decide

theorem fin_sub_le_naive_false : ¬ ∀ a b : Fin 5, a - b ≤ a :=
  fun h => absurd (h 2 3) (by decide)

theorem fin_sub_val_of_le : ∀ a b : Fin 5, b ≤ a → ((a - b : Fin 5) : ℕ) = (a : ℕ) - (b : ℕ) := by
  decide

/-! ## 5. `ENNReal`: `⊤ - ⊤ = 0` -/

theorem ennreal_top_sub_top : (⊤ : ENNReal) - ⊤ = 0 := by
  simp

theorem ennreal_add_sub_naive_false : ¬ ∀ a b : ENNReal, a + b - b = a := by
  intro h
  have := h 1 ⊤
  simp at this

theorem ennreal_add_sub_cancel {a b : ENNReal} (hb : b ≠ ⊤) : a + b - b = a :=
  ENNReal.add_sub_cancel_right hb

/-! ## 6. `Nat.card` of an infinite type is `0` -/

theorem nat_card_nat : Nat.card ℕ = 0 :=
  Nat.card_eq_zero_of_infinite

theorem nat_card_pos_naive_false : ¬ ∀ (α : Type) [Nonempty α], 0 < Nat.card α := by
  intro h
  have := h ℕ
  simp at this

theorem nat_card_pos_of_finite (α : Type) [Nonempty α] [Finite α] : 0 < Nat.card α :=
  Nat.card_pos

/-! ## 7. `Nat.gcd 0 0 = 0` -/

theorem nat_gcd_zero_zero : Nat.gcd 0 0 = 0 := by
  decide

theorem nat_gcd_pos_naive_false : ¬ ∀ a b : ℕ, 0 < Nat.gcd a b :=
  fun h => absurd (h 0 0) (by decide)

theorem nat_gcd_pos_of_pos_left {a : ℕ} (b : ℕ) (ha : 0 < a) : 0 < Nat.gcd a b :=
  Nat.gcd_pos_of_pos_left b ha

/-! ## 8. `Real.arcsin` is clamped outside `[-1, 1]` -/

theorem arcsin_two : arcsin 2 = π / 2 :=
  arcsin_of_one_le (by norm_num)

theorem sin_arcsin_naive_false : ¬ ∀ x : ℝ, sin (arcsin x) = x := by
  intro h
  have := h 2
  rw [arcsin_two, sin_pi_div_two] at this
  norm_num at this

theorem sin_arcsin_of_mem {x : ℝ} (h₁ : -1 ≤ x) (h₂ : x ≤ 1) : sin (arcsin x) = x :=
  sin_arcsin h₁ h₂

/-! ## 9. `Real.Gamma` is `0` at the non-positive integers -/

theorem gamma_neg_one : Gamma (-1) = 0 := by
  simpa using Gamma_neg_nat_eq_zero 1

theorem gamma_ne_zero_naive_false : ¬ ∀ x : ℝ, Gamma x ≠ 0 :=
  fun h => h (-1) gamma_neg_one

theorem gamma_ne_zero_of_pos {x : ℝ} (hx : 0 < x) : Gamma x ≠ 0 :=
  (Gamma_pos_of_pos hx).ne'

end LeanTasks.Solutions.JunkValues
