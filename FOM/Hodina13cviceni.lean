import FOM.Hodina13

-- Tip: zkuste napsat `dsimp [foo]` namísto `unfold foo`

theorem rever_rever {T : Type} (x : List T) : rever (rever x) = x := by
  sorry

theorem sum_oddListIncr (n : ℕ) : sum (oddListIncr n) = n * n := by
  sorry
