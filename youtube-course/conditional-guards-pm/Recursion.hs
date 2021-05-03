fatorial :: Integer -> Integer
fatorial 0 = 1
fatorial n = n * fatorial (n - 1)

mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (a `mod` b)

somaLista :: Num a => [a] -> a
somaLista []     = 0
somaLista (x:xs) = x + somaLista xs

tamanho :: [a] -> Int
tamanho []     = 0
tamanho (_:xs) = 1 + tamanho xs

produtoLista :: Num a => [a] -> a
produtoLista []     = 1
produtoLista (x:xs) = x * produtoLista xs

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) =
    qsort menores ++ [x] ++  qsort maiores
    where
        menores = [e | e <- xs, e < x]
        maiores = [e | e <- xs, e >= x]