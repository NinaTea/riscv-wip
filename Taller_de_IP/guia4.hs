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

--8 Asumo que este está mal porqur no use cantDigitos en ningub momento
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