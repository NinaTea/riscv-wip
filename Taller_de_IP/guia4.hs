
--1 fibonacci
fibonacci :: Integer -> Integer 
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | otherwise = fibonacci (n-1) + fibonacci (n-2)

--2
parteEntera :: Float -> Integer
parteEntera n   | 0 <= n && n < 1 = 0 
                | n == 1 = 1
                | otherwise = 1 + parteEntera(n - 1)

--3 
esDivisible :: (Integer, Integer) -> Bool
esDivisible (a, b) | abs a  -  abs b == 0 = True
                | abs a  -  abs b < 0 = False
                | otherwise = esDivisible (abs (a-b), abs b) 

--4
sumaImpares :: Integer -> Integer
sumaImpares n   | n == 1 = 1
                | n > 0 = 2*n-1 + sumaImpares (n-1)

--5 
medioFact :: Integer -> Integer 
medioFact n     | n == 0 = 1
                | n == 1 = 1
                | n > 0 = n*medioFact (n-2)

--6
sumaDigitos :: Integer -> Integer
sumaDigitos n   | n < 10 = n 
                | otherwise = mod n 10 + sumaDigitos (div nRestado 10) 
                    where nRestado = n - mod n 10
                    
--7
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n < 10 = True
                        | otherwise = mod n 10 == mod (div n 10) 10 && todosDigitosIguales(div n 10)

--8 Asumo que este está mal porque no use cantDigitos en ningún momento
cantDigitos :: Integer -> Integer
cantDigitos n | n < 10 = 1
                | otherwise = 1 + cantDigitos (div n 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito a b    | b == 1 = mod a 10
                    | b > 1 = iesimoDigito (div a 10) (b - 1)

--9 messi

--10
--a
f1 :: Integer -> Integer
f1 n | n == 0 = 1
        | n > 0 = 2 ^ n + f1 (n-1)

f2 :: Integer -> Integer -> Integer
f2 n q | n == 1 = q
        | n > 1 = q ^ n + f2 (n-1) q

f3 :: Integer -> Integer -> Integer
f3 n q | n == 1 = q
        | n > 1 = q ^ (2*n) + f2 (2*n-1) q

f4 :: Integer -> Integer -> Integer
f4 n q = f3 n q - f2 (n-1) q

--11
--a 
eAprox :: Integer -> Float
eAprox n  | n == 0 = 1
            | n > 0  = (1/ fromIntegral (auxFact n) ) + eAprox (n-1)

auxFact :: Integer -> Integer
auxFact n | n == 0 = 1
                | n>0 = n * auxFact(n-1)

e :: Float
e = eAprox 10

--12 ni idea, raro
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n | n == 1 = 1
                | n > 1 = 2 + (1/raizDe2Aprox (n-1)) - 1

--13
dobleSuma :: Integer -> Integer -> Integer
dobleSuma 0 _ = 0
dobleSuma n m = auxPotencia n m + dobleSuma (n-1) m

auxPotencia :: Integer -> Integer -> Integer
auxPotencia _ 0 = 0
auxPotencia n m = n^m + auxPotencia n (m-1)

--14
sumaPotencia :: Integer -> Integer -> Integer -> Integer
sumaPotencia q 0 m = 0
sumaPotencia q n 0 = 0
sumaPotencia 1 n m = n*m
sumaPotencia q n m = (q^n + sumaPotencia q (n-1) m )* auxSumaPotencia q m

auxSumaPotencia :: Integer -> Integer -> Integer
auxSumaPotencia 1 0 = 0
auxSumaPotencia 1 b = b
auxSumaPotencia q b = q^b + auxPotencia q (b-1) 

--15
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 0 m = 0.0
sumaRacionales n m = (fromIntegral n + sumaRacionales (n-1) m) *  auxSumaRacionales n m

auxSumaRacionales :: Integer -> Integer -> Float
auxSumaRacionales n 1 = 1.0
auxSumaRacionales n m = 1.0 / fromIntegral m + auxSumaRacionales n (m-1)

--16
--a
menorDivisor :: Integer -> Integer
menorDivisor 0 = 1
menorDivisor 1 = 1
menorDivisor n = auxMenorDivisor n (floor (sqrt (fromInteger n)))

auxMenorDivisor :: Integer -> Integer -> Integer
auxMenorDivisor n m | m == 1 = n
                        | mod n m /= 0 = auxMenorDivisor n (m-1)
                        | otherwise = m

--b
esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo p | menorDivisor p == p = True
                |otherwise = False

--c
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos p 1 = False
sonCoprimos 1 q = False 
sonCoprimos p q | mod p q == 0 = False
                | mod q p == 0 = False
                | otherwise = True

--d he perecido ante el poder de los números primos y su aleatoriedad.
-- En realidad, ya agoté mi capacidad de pensamiento por hoy.

--17 idem fibonacci


