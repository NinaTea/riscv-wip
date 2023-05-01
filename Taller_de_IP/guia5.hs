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

--2
--1
pertenece :: Eq t => t -> [t] -> Bool
pertenece _ [] = False
pertenece t (x:xs) | t == x = True
                    | otherwise = pertenece t xs  
--2 
todosIguales :: Eq x => [x] -> Bool
todosIguales [] = False
todosIguales [x] = True
todosIguales (x:xs) = todosIguales xs && (head xs == x)

--3
todosDistintos :: Eq t => [t] -> Bool
todosDistintos [] = True
todosDistintos [t] = True
todosDistintos (x:xs) = todosDistintos xs && (head xs /= x)

--4
hayRepetidos :: Eq t => [t] -> Bool
hayRepetidos [x] = False
hayRepetidos (x:xs) = hayRepetidos xs || (head xs == x)
 
