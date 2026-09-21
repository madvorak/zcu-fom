import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Have


/-- Psaní `↓t` je trochu obecnější než psaní `Function.const _ t`. -/
notation:max "↓"t:arg => (fun _ => t)

/-- Aplikace `↔` zleva doprava. -/
postfix:max ".→" => Iff.mp

/-- Aplikace `↔` zprava doleva. -/
postfix:max ".←" => Iff.mpr
