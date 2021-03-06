data Colour = RGB Int Int Int deriving Show

red :: Colour -> Int
red (RGB r _ _) = r

green :: Colour -> Int
green (RGB _ g _) = g

blue :: Colour -> Int
blue (RGB _ _ b) = b

main :: IO ()
main = do
    let c = RGB 10 20 30
    print $ red c
    print $ green c
    print $ blue c