-- No editar esta parte
main :: IO ()
main = do
  x <- readLn
  print (sumaMenosQueMax (x :: (Int, Int, Int)))

sumaMenosQueMax :: (Int, Int, Int) -> Bool
-- Completar acá la definición de la función
sumaMenosQueMax (a, b, c) | maximo > (minimo + mediano) = True
                          | otherwise = False
                            where maximo = auxMax a b c
                                  mediano = auxMedio a b c
                                  minimo = auxMin a b c

-- Pueden agregan las funciones que consideren necesarias
auxMax :: Int -> Int -> Int -> Int
auxMax a b c | a >= b && a >= c = a
          | b >= a && b >= c = b
          | c >= a && c >= b = c

auxMin :: Int -> Int -> Int -> Int
auxMin a b c | a <= b && a <= c = a
          | b <= a && b <= c = b
          | c <= a && c <= b = c


auxMedio :: Int -> Int -> Int -> Int
auxMedio a b c | a == b && b == c = a
            | a == auxMax a b c && b > c && a /= b = b
            | a == auxMax a b c && c > b && a /= c = c
            | a == auxMax a b c && c == b && a /= c = c
            | a == auxMax a b c && a == b = c 
            | a == auxMax a b c && a == c = b

            | b == auxMax a b c && a > c && a /= b = a
            | b == auxMax a b c && c > a && c /= b = c
            | b == auxMax a b c && c == a && b /= c = a
            | b == auxMax a b c && b == a = c 
            | b == auxMax a b c && b == c = a

            | c == auxMax a b c && a > b && a /= c = a
            | c == auxMax a b c && b > a && b /= c = b
            | c == auxMax a b c && b == a && b /= c = a
            | c == auxMax a b c && c == a = b 
            | c == auxMax a b c && c == b = a




