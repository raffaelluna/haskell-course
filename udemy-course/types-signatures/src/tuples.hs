t0 :: (Int, Int)
t0 = (1234, 1234)

t1 :: (String, Int, Double)
t1 = ("Sometext", 8, 3.141)

t2 :: ([Int], [String], (Float, Char))
t2 = ([1, 2, 3, 4], ["aaa", "bbb"], (1.0, 'o'))

main :: IO ()
main = do
    print t0
    print t1
    print t2

