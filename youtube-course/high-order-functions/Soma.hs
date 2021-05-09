soma :: Int -> Int -> Int
soma x y = x + y

dobra = \x -> (* 2) x

metade :: Double -> Double
metade = (/ 2)

reciproco :: Double -> Double
reciproco = (1 /)

duasVezes :: (a -> a) -> a -> a
duasVezes f x = f (f x)

quadruplica :: Fractional  a => a -> a
quadruplica = duasVezes (/2)

map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]

mapV2 :: (a -> b) -> [a] -> [b]
mapV2 f []     = []
mapV2 f (x:xs) = f x : mapV2 f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs, p x]

filterRec :: (a -> Bool) -> [a] -> [a]
filterRec p [] = []
filterRec p (x:xs)
  | p x = x : filterRec p xs
  | otherwise = filterRec p xs

somaQuadPares :: [Int] -> Int
somaQuadPares ns = sum [n ^ 2 | n <- ns, even n]

somaQuadParesRec :: [Int] -> Int
somaQuadParesRec ns = sum $ map (^ 2) $ filter even ns

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v []     = v
foldr' f v (x:xs) = f x (foldr' f v xs)

produto = foldr' (*) 1

tamanho :: [a] -> Int
tamanho xs = foldr' (\a b -> 1 + b) 0 xs

tamanho' :: [a] -> Int
tamanho' = foldr (\_ n -> n + 1) 0

reverso :: [a] -> [a]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

reverso' :: [a] -> [a]
reverso' = foldr (\x xs -> xs ++ [x]) []

somaV2 :: Num a => [a] -> a
somaV2 ns = soma' 0 ns 
  where
     soma' v [] = v
     soma' v (x:xs) = soma' (v+x) xs

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' f v [] = v
foldl' f v (x:xs) = foldl' f (f v x) xs

tamanho'' :: [a] -> Int
tamanho'' = foldl' (\n _ -> n + 1) 0

reverse' :: [a] -> [a]
reverse' = foldl' (\xs x -> (x:xs)) []

(.) :: (b -> c) -> (a -> b) -> (a -> c)
f . g = \x -> f (g x)

main :: IO ()
main = do
  putStrLn "hello world"
