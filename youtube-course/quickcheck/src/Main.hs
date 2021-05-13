module Main where

import           Test.QuickCheck

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort lhs ++ [x] ++ qsort rhs
  where
    lhs = [e | e <- xs, e <= x]
    rhs = [e | e <- xs, e > x]

prop_idempotencia :: Ord a => [a] -> Bool
prop_idempotencia xs = qsort (qsort xs) == qsort xs

prop_length :: Ord a => [a] -> Bool
prop_length xs = length (qsort xs) == length xs

prop_minimum :: Ord a => [a] -> Bool
prop_minimum xs = head (qsort xs) == minimum xs

-- $> prop_idempotencia [1]
-- $> prop_length [1, 3, 6, 8, 9]
-- $> quickCheck prop_idempotencia
-- $> quickCheck (prop_length :: [Int] -> Bool)
main :: IO ()
main = do
  putStrLn "hello world"
