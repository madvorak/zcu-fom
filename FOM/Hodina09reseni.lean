import FOM.Hodina09


example (f₁ f₂ f₃ : ℤ → ℤ) (hf₁ : Prosta f₁) (hf₂ : Bijektivni f₂) (hf₃ : Prosta f₃) :
    Prosta (f₁ ∘ f₂ ∘ f₃ ∘ f₁) := by
  apply sloz_prosta
  apply sloz_prosta
  apply sloz_prosta
  exact hf₁
  exact hf₃
  exact hf₂.left
  exact hf₁

/--
Složení surjektivních funkcí je surjektivní funkce.
-/
theorem sloz_surjektivni {A B C : Type} {f : A → B} {g : B → C} (hf : Surjektivni f) (hg : Surjektivni g) :
    Surjektivni (g ∘ f) := by
  intro c
  obtain ⟨b, hb⟩ := hg c
  obtain ⟨a, ha⟩ := hf b
  use a
  rw [←hb, ←ha]
  rfl

/--
Složení bijektivních funkcí je bijektivní funkce.
-/
theorem sloz_bijektivni {A B C : Type} {f : A → B} {g : B → C} (hf : Bijektivni f) (hg : Bijektivni g) :
    Bijektivni (g ∘ f) := by
  obtain ⟨hf₁, hf₂⟩ := hf
  obtain ⟨hg₁, hg₂⟩ := hg
  constructor
  · apply sloz_prosta
    · exact hf₁
    · exact hg₁
  · apply sloz_surjektivni
    · exact hf₂
    · exact hg₂
