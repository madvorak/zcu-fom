import FOM.Basic


/--
Prostá funkce je definovaná jako funkce bez kolizí.
-/
def Prosta {A B : Type} (f : A → B) : Prop := ∀ x y : A, x ≠ y → f x ≠ f y

/--
Surjektivní funkce je definovaná jako funkce, která vrací všechny výstupy.
-/
def Surjektivni {A B : Type} (f : A → B) : Prop := ∀ z : B, ∃ x : A, f x = z

/--
Bijektivní funkce je definována jako prostá a surjektivní funkce zároveň.
-/
def Bijektivni {A B : Type} (f : A → B) : Prop := Prosta f ∧ Surjektivni f

/--
Složení prostých funkcí je prostá funkce.
-/
theorem sloz_prosta {A B C : Type} {f : A → B} {g : B → C} (hf : Prosta f) (hg : Prosta g) :
    Prosta (g ∘ f) := by
  intro x y hxy
  apply hg
  apply hf
  exact hxy

/--
Pokud jsou dvě funkce navzájem inverzní, první funkce je bijektivní.
-/
theorem bijektivni_kdyz_inverz {A B : Type} {f : A → B} {g : B → A}
    (hgf : ∀ a : A, g (f a) = a) (hfg : ∀ b : B, f (g b) = b) :
    Bijektivni f := by
  constructor
  · intro a₁ a₂ haa hfaa
    apply haa
    rw [←hgf a₁, ←hgf a₂, hfaa]
  · unfold Surjektivni
    by_contra! ⟨b, hb⟩
    have hfgb : f (g b) ≠ b
    · apply hb
    apply hfgb
    apply hfg
