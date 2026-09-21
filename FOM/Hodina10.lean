import FOM.Hodina07
import FOM.Hodina09

/--
Pokud jsou dvě funkce navzájem inverzní, obě funkce jsou bijektivní.
-/
theorem bijektivni_kdyz_sloz_id {A B : Type} {f : A → B} {g : B → A}
    (hfg : f ∘ g = id) (hgf : g ∘ f = id) :
    Bijektivni f ∧ Bijektivni g := by
  have hgf' : ∀ a : A, g (f a) = a
  · intro a
    exact congr_fun hgf a
  have hfg' : ∀ b : B, f (g b) = b
  · intro b
    exact congr_fun hfg b
  constructor
  · exact bijektivni_kdyz_inverz hgf' hfg'
  · exact bijektivni_kdyz_inverz hfg' hgf'

/--
Pro žádné `T` neexistuje funkce, která by každému prvku `T` přiřadila množinu prvků z `T` tak,
aby každá množina prvků z `T` byla obrazem nějakého prvku `T`.
-/
theorem vetaCantor (T : Type) : ¬(∃ f : T → Set T, Surjektivni f) := by
  intro ⟨f, hf⟩
  obtain ⟨a, ha⟩ := hf { x : T | x ∉ f x }
  have hafa : (a ∈ f a) ↔ (a ∉ f a)
  · exact of_eq (congr_arg (a ∈ ·) ha)
  exact nemozna_ekvivalence hafa
