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


