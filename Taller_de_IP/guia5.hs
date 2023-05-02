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
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:xs) = hayRepetidos xs || (head xs == x)

--5
quitar :: Eq t => t -> [t] -> [t]
quitar t [] = []
quitar t (x:xs) | not (pertenece t (x:xs)) = (x:xs)
                | t == x = xs
                | otherwise = quitar t lista
                    where lista = (xs ++ [x])
--6                    
quitarTodos :: Eq t => t -> [t] -> [t] 
quitarTodos t [] = []
quitarTodos t (x:xs)| not (pertenece t (x:xs)) =  (x:xs)
                    | x == t && not(pertenece t xs) = xs
                    | x == t && pertenece t xs = quitarTodos t xs 
                     | x /= t && pertenece t xs = quitarTodos t xs ++ [x]
--2.7. eliminarRepetidos :: (Eq t) => [t] -> [t] que deja en la lista una ´unica aparici´on de cada elemento, eliminando
--las repeticiones adicionales.
--2.8
--2.9

--3
--3.1
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = sumatoria xs + x

--3.2
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) =  x * productoria xs

--3.3
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) | x >= head xs = maximo (x:tail xs)
                | otherwise = maximo xs

--3.4
sumarN :: Integer -> [Integer] -> [Integer]
sumarN x [y] = [ x + y ]
sumarN x (y:ys) = x+y: sumarN x ys

--3.5
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = x+x: sumarN x xs

--3.7
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) | length (tail xs) > 1 = sumarElUltimo (x:tail xs)
--  
                     
                     

