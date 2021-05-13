module Main where

-- a é variável de tipo
tamanho :: [a] -> Int
tamanho []     = 0
tamanho (_:xs) = 1 + tamanho xs

impar :: Integral a => a -> Bool
impar n = n `mod` 2 == 1
 
quadrado :: Num a => a -> a
quadrado x = x * x

quadradoMais6Mod9 :: Integral a => a -> a
quadradoMais6Mod9 x = (x + 6) `mod` 9

raizes2Grau :: Floating a => a -> a -> a -> (a, a)
raizes2Grau a b c =
  ( ((-b) + sqrt (b ^ 2 - 4 * a * c)) / (2 * a)
  , ((-b) - sqrt (b ^ 2 - 4 * a * c)) / (2 * a))

raizes2Grauv2 :: Floating a => a -> a -> a -> (a, a)
raizes2Grauv2 a b c = (x1, x2)
  where
    x1 = ((-b) + sqDelta) / (2 * a)
    x2 = ((-b) - sqDelta) / (2 * a)
    delta = b ^ 2 - 4 * a * c
    sqDelta = sqrt delta

main :: IO ()
main = do
  let x' = 3
   in putStrLn $ "hello world" ++ show x'
