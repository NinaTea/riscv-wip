--1
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: [t] -> t 
ultimo (x:xs) = (x:xs) !! ( fromInteger (longitud (x:xs)) - 1)  

principio :: [t] -> [t]
principio [] = []
principio (x:xs) = [x]

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverse (x:xs)
--soy re trucha ya se