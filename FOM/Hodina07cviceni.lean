import FOM.Basic

-- Povolené taktiky: `exact`, `apply`, `intro`, `constructor`, `left`, `right`, `cases`, `obtain`, `rw`
-- Taktika `exact` je povolena pouze jako `exact a` kde `a` je term v lokálním kontextu.

example (P Q R : Prop) : P ∧ Q ∧ R → Q ∧ P ∧ R ∧ P := by
  tauto -- TODO dokažte bez použití `tauto`

example (P Q : Prop) : P → P ∨ Q := by
  tauto -- TODO dokažte bez použití `tauto`

example (P Q R S : Prop) (pq : P ↔ Q) (qr : Q ↔ R) (rs : R ↔ S) : P ↔ S := by
  tauto -- TODO dokažte bez použití `tauto`

example (P Q R : Prop) : P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R) := by
  tauto -- TODO dokažte bez použití `tauto`

example (P : Prop) : P → ¬¬P := by
  tauto -- TODO dokažte bez použití `tauto`

example (P Q : Prop) : ¬P ∧ ¬Q → ¬(P ∨ Q) := by
  tauto -- TODO dokažte bez použití `tauto`
