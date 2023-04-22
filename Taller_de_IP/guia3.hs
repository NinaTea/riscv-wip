import GHC.Integer.GMP.Internals (sqrInteger)
import GHC.Float (sqrtFloat)
import Data.Fixed (mod')

--1
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

--ej 2
--a 
-- problema absoluto{z: Z} Z>0 {
--          requiere { - } 
--          asegura {res = |z|}
-- }
absoluto :: Integer -> Integer
absoluto n | n == 0 = 0
           | n < 0 = n *(-1)
           | otherwise = n 

--b 
--maximo absoluto
maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto a b | absoluto a > absoluto b  = a
                   | otherwise = b

--d 
--problema alguno_es(a,b: Q): Bool{
--  requiere: {-}
--  asegura: {(res = true)n((a = 0) u (b = 0)}
--}
algunoEs :: Integer -> Integer -> Bool
algunoEs a b    | a == 0 = True 
                | b == 0 = True 
                | otherwise = False

algunoEs2 :: Integer -> Integer -> Bool
algunoEs2 a b   | a /= 0 && b /= 0 = False 
algunoEs2 a b   | a == 0 || b == 0 = True 
         
--ej 4
-- a )  prodInt: calcula el producto interno entre dos tuplas R × R
-- problema prodInt((a, b), (c,d): R x R): R {
--      requiere: {-}
--      asegura: {res = e E R}     
--}

prodInt :: (Integer, Integer) -> (Integer, Integer) -> Integer
prodInt (a, b) (c,d) = a*c + b*d 

-- b )  todoMenor: dadas dos tuplas R×R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada
-- correspondiente de la segunda tupla
-- problema todoMenor((a, b), (c,d): R x R): Bool {
--      requiere: {-}
--      asegura: {(a<b)n(b<d)n(res=True)}     
--}
todoMenor :: (Integer, Integer) -> (Integer, Integer) -> Bool
todoMenor (a, b) (c, d) | a<c && b<d = True
                        | otherwise = False

-- c )  distanciaPuntos: calcula la distancia entre dos puntos de R2
-- problema distanciaPuntos((a, b), (c,d): R x R): R {
--      requiere: {-}
--      asegura: {res E R>0}     
--}
 
distanciaPuntos :: ((Float, Float), (Float, Float)) -> Float
distanciaPuntos ((a,b), (c,d)) = sqrtFloat( (a-c)**2 + (b-d)**2)

-- e)
-- dada una terna de n´umeros enteros y un natural, calcula la suma de los elementos de la terna que
-- son m´ultiplos del n´umero natural
sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (a,b,c) d |  mod a d == 0 && mod b d == 0 && mod c d == 0 = a+b+c
sumarSoloMultiplos (a,b,c) d |  mod a d /= 0 && mod b d == 0 && mod c d == 0 = b+c
sumarSoloMultiplos (a,b,c) d |  mod a d /= 0 && mod b d /= 0 && mod c d == 0 = c
sumarSoloMultiplos (a,b,c) d |  otherwise = 0

-- g)
crearPar :: a-> b -> (a,b)
crearPar a b = (a,b)