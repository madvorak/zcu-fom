import FOM.Hodina10


-- Motivační příklad:
example : ∃ f : (ℕ → Fin 2) → (ℕ → Fin 3), Bijektivni f :=
  sorry -- Nedokazujte tady! `Hodina11zaver.lean` obsahuje řešení.

-- The ultimate goal:
example {A B : Type} (𝔸 : Set A) (𝔹 : Set B) :
    (∃ f : 𝔸 → 𝔹, Bijektivni f) ↔ ((∃ f : 𝔸 → 𝔹, Prosta f) ∧ (∃ g : 𝔹 → 𝔸, Prosta g)) :=
  sorry -- Nedokazujte tady! `Hodina11zaver.lean` obsahuje důkaz využívající aparát, který si tu připravíme.


/--
Definujeme počet předchůdců určitého prvku `A` či `B`.
Obecná definice je zapsaná pro `a : A`:
`Generace f g a n` znamená, že `a` má přesně `n` předchůdců.
Pokud chceme charakterizovat prvek `b : B`, prohodíme funkce `f` a `g`:
`Generace g f b n` znamená, že `b` má přesně `n` předchůdců.
-/
private inductive Generace : {A B : Type} → (A → B) → (B → A) → A → ℕ → Prop
-- Pokud neexistuje `b : B` takové že `g b = a` pak říkáme, že `a` je sirotek.
| nula {A B : Type} {f : A → B} {g : B → A} {a : A} (sirot : ¬ ∃ b : B, g b = a) :
  -- Sirotek `a` má `0` předchůdců vzhledem k funkcím `f` a `g`.
  Generace f g a 0
-- Pokud existuje `p : B` takové že `g p = a` pak říkáme, že `p` je rodič `a` vzhledem k funkcím `f` a `g`.
| nasl {A B : Type} {f : A → B} {g : B → A} {a : A} (p : B) (rodic : g p = a) {n : ℕ} (rodokmen : Generace g f p n) :
  -- Pokud rodič `p` má `n` předchůdců, pak `a` má `n+1` předchůdců vzhledem k funkcím `f` a `g`.
  Generace f g a n.succ


-- Tohle lemma se vám nejspíš nebude hodit, ale můžete ho použít...
/--
Počet předchůdců je unikátní.
Sice se může stát, že pro dané `a : A` nebude platit `Generace f g a n` pro žádné `n`
(to když `a : A` má nekonečně mnoho předchůdců nebo je "v cyklu"),
ale nemůže se stát, že by například platilo `Generace f g a 3` i `Generace f g a 5` zároveň.
-/
private lemma jedinaGenerace {A B : Type} {f : A → B} {g : B → A} {a : A} (hf : Prosta f) (hg : Prosta g) :
    (m n : ℕ) → (Generace f g a m) → (Generace f g a n) → (m = n)
| 0, 0, _, _ => rfl
| N+1, 0, fgaN, fga0 => by
  cases fgaN with
  | nasl => cases fga0 with
  | nula => simp_all
| 0, M+1, fga0, fgaM => by
  cases fgaM with
  | nasl => cases fga0 with
  | nula => simp_all
| N+1, M+1, fgaN, fgaM => by
  cases fgaN with
  | nasl p hpa pgen => cases fgaM with
  | nasl q hqa qgen => rw [jedinaGenerace hg hf N M pgen (by
      convert qgen
      by_contra contr
      apply hg p q contr
      rw [hpa, hqa]
    )]

variable {A B : Type} -- Implicitní typové proměnné (pro vše, co následuje) neposouvat výše!

/--
Definujeme prvek se sudým počtem předchůdců.
-/
private def SudaGenerace (f : A → B) (g : B → A) (a : A) : Prop :=
  ∃ n : ℕ, Generace f g a (2*n)

/--
Definujeme prvek s lichým počtem předchůdců.
-/
private def LichaGenerace (f : A → B) (g : B → A) (a : A) : Prop :=
  ∃ n : ℕ, Generace f g a (2*n + 1)

/--
Každý prvek s lichým počtem předchůdců má nějakého rodiče (a ten má sudý počet předchůdců).
-/
private lemma LichaGenerace.existuje_rodic {f : A → B} {g : B → A} {a : A}
    (lichaGen : LichaGenerace f g a) :
    ∃ p : B, g p = a ∧ SudaGenerace g f p := by
  sorry -- TODO

/--
Pokud prvek má lichý počet předchůdců, jeho potomek má sudý počet předchůdců.
-/
private lemma LichaGenerace.pristiSudaGenerace {f : A → B} {g : B → A} {a : A}
    (lichaGen : LichaGenerace f g a) :
    SudaGenerace g f (f a) := by
  sorry -- TODO

/--
Pokud prvek má sudý počet předchůdců, jeho potomek má lichý počet předchůdců.
-/
private lemma SudaGenerace.pristiLichaGenerace {f : A → B} {g : B → A} {a : A}
    (sudaGen : SudaGenerace f g a) :
    LichaGenerace g f (f a) := by
  sorry -- TODO

/--
Pokud nesirotek má sudý počet předchůdců, jeho rodič má lichý počet předchůdců.
-/
private lemma SudaGenerace.predchoziLichaGenerace {f : A → B} {g : B → A} {a : A}
    (sudaGen : SudaGenerace g f (f a)) (hf : Prosta f) :
    LichaGenerace f g a := by
  sorry -- TODO

/--
Definujeme funkci `g⁻¹` pro jednoduchost pouze na prvcích liché generace.
Argument `a` je implicitní (stejně jako původní funkce `f` a `g` jsou implicitní argumenty).
Explicitním argumentem je důkaz, že `a` má lichý počet předchůdců vzhledem k funkcím `f` a `g`.
-/
private noncomputable def inverze {f : A → B} {g : B → A} {a : A} (lichaGen : LichaGenerace f g a) : B :=
  lichaGen.existuje_rodic.choose

/--
Pro všechna `a` z liché generace platí `g (g⁻¹ a) = a`.
-/
private lemma LichaGenerace.g_inverze {f : A → B} {g : B → A} {a : A} (lichaGen : LichaGenerace f g a) :
    g (inverze lichaGen) = a :=
  lichaGen.existuje_rodic.choose_spec.left

/--
Pro všechna `a` z liché generace je `g⁻¹ a` ze sudé generace.
-/
private lemma LichaGenerace.sudaGen_inverze {f : A → B} {g : B → A} {a : A} (lichaGen : LichaGenerace f g a) :
    SudaGenerace g f (inverze lichaGen) :=
  lichaGen.existuje_rodic.choose_spec.right

/--
Funkce `g⁻¹` se tam, kde je definována, chová jako prostá funkce.
-/
private lemma inverze_jakoProsta {f : A → B} {g : B → A} {x y : A} (hxy : x ≠ y)
    (hx : LichaGenerace f g x) (hy : LichaGenerace f g y) :
    inverze hx ≠ inverze hy := by
  sorry -- TODO

/--
Konečně hlavní věta!
Pokud existuje prostá funkce `f : A → B` i prostá funkce `g : B → A`, pak jsou `A` a `B` stejně velké.
-/
theorem vetaSchroderBernstein : (∃ f : A → B, Prosta f) ∧ (∃ g : B → A, Prosta g) → ∃ f' : A → B, Bijektivni f' := by
  intro ⟨⟨f, hf⟩, ⟨g, hg⟩⟩
  classical
  let F : A → B := fun a => if ha : LichaGenerace f g a then inverze ha else f a
  sorry -- TODO
