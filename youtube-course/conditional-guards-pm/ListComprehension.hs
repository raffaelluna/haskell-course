minhaconcat xss = [x | xs <- xss, x <- xs]

tam xs = sum [1 | _ <- xs]

divisores n = [x | x <- [1..n], n `mod` x == 0]

primo x = divisores x == [1, x]

primosAteN n = [x | x <- [2..n], primo x]

pairs xs = zip xs $ tail xs

sorted :: Ord a => [a] -> Bool
sorted xs = null [() | (p, s) <- pairs xs, p > s]
