import FOM.Hodina09


example (f₁ f₂ f₃ : ℤ → ℤ) (hf₁ : Prosta f₁) (hf₂ : Bijektivni f₂) (hf₃ : Prosta f₃) :
    Prosta (f₁ ∘ f₂ ∘ f₃ ∘ f₁) := by
  sorry

/--
Složení surjektivních funkcí je surjektivní funkce.
-/
theorem sloz_surjektivni {A B C : Type} {f : A → B} {g : B → C} (hf : Surjektivni f) (hg : Surjektivni g) :
    Surjektivni (g ∘ f) := by
  sorry

/--
Složení bijektivních funkcí je bijektivní funkce.
-/
theorem sloz_bijektivni {A B C : Type} {f : A → B} {g : B → C} (hf : Bijektivni f) (hg : Bijektivni g) :
    Bijektivni (g ∘ f) := by
  sorry
