import FOM.Hodina10

-- Bude se hodit:
#check congr_arg
#check Function.comp_assoc

theorem levy_inverz_eq_pravy_inverz {A B : Type} {f : A → B} {g₁ g₂ : B → A}
    (hfg : f ∘ g₁ = id) (hgf : g₂ ∘ f = id) :
    g₁ = g₂ := by
  calc
  _ = (g₂ ∘ f) ∘ g₁ := congr_arg (· ∘ g₁) hgf |>.symm
  _ = g₂ ∘ (f ∘ g₁) := Function.comp_assoc g₂ f g₁
  _ = g₂            := congr_arg (g₂ ∘ ·) hfg

example {A B : Type} {f : A → B} {g₁ g₂ : B → A}
    (hfg : f ∘ g₁ = id) (hgf : g₂ ∘ f = id) :
    Bijektivni f := by
  rw [levy_inverz_eq_pravy_inverz hfg hgf] at hfg
  obtain ⟨hf, -⟩ := bijektivni_kdyz_sloz_id hfg hgf
  exact hf
