import FOM.Hodina10

-- Bude se hodit:
#check congr_arg
#check Function.comp_assoc

theorem levy_inverz_eq_pravy_inverz {A B : Type} {f : A → B} {g₁ g₂ : B → A}
    (hfg : f ∘ g₁ = id) (hgf : g₂ ∘ f = id) :
    g₁ = g₂ := by
  sorry -- TODO dokažte "ručně" (tj. bez hledání v knihovně)

example {A B : Type} {f : A → B} {g₁ g₂ : B → A}
    (hfg : f ∘ g₁ = id) (hgf : g₂ ∘ f = id) :
    Bijektivni f := by
  sorry -- TODO dokažte via theorems we already proved
