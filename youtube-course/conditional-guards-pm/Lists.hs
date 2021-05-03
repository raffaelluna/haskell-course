-- (:) chamado de operador cons de constructor
indexa :: [a] -> Int -> a
indexa xs i = head $ drop i xs

fatorial :: Integer -> Integer
fatorial n = product [2..n]