import FOM.Basic
import Mathlib.Data.Nat.Prime.Basic


theorem strong_induction {P : ℕ → Prop} (hP : ∀ m : ℕ, (∀ k < m, P k) → P m) :
    ∀ n : ℕ, P n := by
  sorry -- TODO dokažte "ručně" (tj. bez hledání v knihovně)


-- Bude se hodit:
#check Nat.exists_dvd_of_not_prime
#check Nat.le_of_dvd
#check Nat.dvd_trans

theorem exists_prime_divisor : ∀ n : ℕ, 2 ≤ n → ∃ p : ℕ, p.Prime ∧ p ∣ n := by
  sorry -- TODO dokažte
