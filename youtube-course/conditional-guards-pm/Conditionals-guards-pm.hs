-- é necessário colocar a restrição de tipo 'Num a'
-- pode ser que um outro tipo diferente de Num a não
-- contenha a operação '<', por exemplo. Necessário 
-- também que o número seja ordenável (Ord a)
abs :: (Num a, Ord a) => a -> a
abs n = if n < 0 then (-n) else n

signum :: (Num a, Ord a) => a -> a
signum n = if n < 0
           then -1
           else if n == 0
                then 0
                else 1

signumV2 :: (Num a, Ord a) => a -> a
signumV2 n
    | n < 0  = -1
    | n == 0 = 0
    | otherwise = 1

raizes2GrauV3 :: (Ord a, Floating a) => a -> a -> a -> (a, a)
raizes2GrauV3 a b c =
    if delta < 0
    then error "Delta negativo."
    else (x1, x2)
    where
        x1 = ((-b) + sqDelta) / ( 2 * a)
        x2 = ((-b) - sqDelta) / ( 2 * a)
        delta = b^(2 :: Int) - 4 * a * c
        sqDelta = sqrt delta

nao :: Bool -> Bool
nao x = if x then False else True

naoV2 :: Bool -> Bool
naoV2 x
    | x = False
    | otherwise = True

naoV3 :: Bool -> Bool
naoV3 True = False
naoV3 False = True

soma 0 y = y
soma x 0 = x
soma x y = x + y

mult 0 _ = 0
mult _ 0 = 0
mult 1 y = y
mult x 1 = x
mult x y = x * y

mult2 = \x y -> x * y