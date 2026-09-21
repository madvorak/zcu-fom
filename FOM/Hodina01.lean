import FOM.Basic


-- ## Basic interaction

#eval 1 + 2 * 3
#eval (1 + 2) * 3
#eval Float.sqrt 2
#check Float.sqrt
#check Float.sqrt 2
#eval Float.sqrt 2.0
#eval Float.sqrt 0.1
#eval Float.sqrt (-1)
#eval Float.sqrt (-1 + 10)
#eval Float.cos 0 + 1
#eval Nat.max 7 13 / Nat.min 5 6 - 91 % 9
#eval 2 ^ 3 < 3 ^ 2
#eval "hello" ++ " " ++ "world"
#eval List.range 10
#check List.range
#check List.range 10
#eval List.map (· ^ 3) (List.range 10)


-- ## Definitions

def picca : Float := 3.14159

#check picca
#print picca
#eval picca
#eval Float.sin (picca / 6)
#eval Float.sin (picca * 9)


def obvodObdelnika (a b : Nat) : Nat := 2 * (a + b)

#check obvodObdelnika
#print obvodObdelnika
#eval obvodObdelnika 3 2
#eval obvodObdelnika 10 10


-- ## Conditionals

def parita (n : Int) : String :=
if n % 2 == 0
then "even"
else "odd"

#eval parita 4
#eval parita 5
#eval parita 0
#eval parita (99999999999 * 2 * 77777777777777777 + 1)
#eval parita (2 - 3)


def dvojiceRostouci (x y : Int) : List Int :=
if x == y
then [x]
else if x < y
     then [x, y]
     else [y, x]

#eval dvojiceRostouci 4 6
#eval dvojiceRostouci 5 (-5)
#eval dvojiceRostouci 8 8


-- ## Recursion

def faktorial : Nat → Nat
| 0   => 1
| n+1 => (n+1) * faktorial n

#eval faktorial 6
#eval faktorial 200
#eval faktorial 3000 / faktorial 2999


def fibonacci : Nat → Nat
| 0   => 0
| 1   => 1
| n+2 => fibonacci n + fibonacci (n+1)

#eval fibonacci 5
#eval fibonacci 10
#eval fibonacci 33


def cifernySoucet (a : Nat) : Nat :=
if a < 10
then a
else (a % 10) + cifernySoucet (a / 10)

#eval cifernySoucet 524
#eval cifernySoucet 10200
#eval cifernySoucet (10^50 - 1)
#eval cifernySoucet 0


private def sumRow (f : Nat → Nat → Float) (m : Nat) : Nat → Float
| 0   => 0.0
| n+1 => f m n + sumRow f m n

private def sumGrid (f : Nat → Nat → Float) (n : Nat) : Nat → Float
| 0   => 0.0
| m+1 => sumRow f m n + sumGrid f n m

def sum2D (f : Nat → Nat → Float) (n : Nat) : Float :=
sumGrid f n n

#eval sum2D ↓↓1.0 7
#eval sum2D ↓Nat.toFloat 5
#eval sum2D (Nat.toFloat <| · * ·) 4
#eval sum2D (if · == · then 1.0 else 0.0) 42
#eval sum2D (fun a b : Nat => 1.0 / (1.0 + Nat.toFloat a) / (1.0 + Nat.toFloat b)) 100
#eval sum2D (fun a b : Nat => 1.0 / (2.0 ^ Nat.toFloat (a + b))) 20


def ackermann : Nat → Nat → Nat
| 0  , n   => n+1
| m+1, 0   => ackermann m 1
| m+1, n+1 => ackermann m (ackermann (m+1) n)

#eval ackermann 0 100
#eval ackermann 1 100
#eval ackermann 2 100
#eval ackermann 3 7
#eval ackermann 3 8
#eval ackermann 3 9
#eval ackermann 4 0
