module Main where

-- Tipo soma

data Dir = Norte
         | Sul
         | Leste
         | Oeste
         deriving Show

type Coord = (Int, Int)
type Passo = Coord -> Coord

para :: Dir -> Passo
para Norte (x, y) = (x, y + 1)
para Sul (x, y) = (x, y - 1)
para Leste (x, y) = (x + 1, y)
para Oeste (x, y) = (x - 1, y)

caminhar :: [Dir] -> Passo
caminhar ds coord = foldl (flip para) coord ds

caminhar' :: [Dir] -> Passo
caminhar' ds coord = foldl (flip para) coord ds

-- Tipo produto
--          ConstTipo
data Ponto = MkPonto Double Double
              deriving Show

dist :: Ponto -> Ponto -> Double
dist (MkPonto x y) (MkPonto x' y') =
  sqrt $ (x - x')^2 + (y - y')^2

data Forma = Circulo Ponto Double
           | Retangulo Ponto Double Double

quadrado :: Ponto -> Double -> Forma
quadrado p l = Retangulo p l l

-- Tipos parâmetros

data Identidade a = Id a

--data Maybe a = Nothing | Just a

maybeDiv :: Int -> Int -> Maybe Int
maybeDiv _ 0 = Nothing
maybeDiv x y = Just (x `div` y)

maybeHead :: [a] -> Maybe a
maybeHead [] = Nothing
maybeHead (x:xs) = Just x

divComErro :: Int -> Int -> Int
divComErro m n =
  case maybeDiv m n of
    Nothing -> error "divisão por zero!"
    Just x -> x

--data Either' a b = Left a | Right b

eitherDiv :: Int -> Int -> Either String Int
eitherDiv _ 0 = Left "divisão por zero"
eitherDiv x y = Right (x `div` y)

data Fuzzy = Verdadeiro | Falso | Pertinencia Double deriving Show

fuzzifica :: Double -> Fuzzy
fuzzifica x
  | x <= 0 = Falso
  | x >= 1 = Verdadeiro
  | otherwise = Pertinencia x

newtype Identidade' = Id' Int

--Tipos recursivos

data Lista a = Vazia | Cons a (Lista a)

data Arvore a = Folha a
              | No { _right :: Arvore a
                   , _value :: a
                   , _left  :: Arvore a
                   } deriving Show

t :: Arvore Int
t = No t1 5 t2 where
  t1 = No (Folha 1) 3 (Folha 4)
  t2 = No (Folha 6) 7 (Folha 9)

contem :: Ord a => Arvore a -> a -> Bool
contem (Folha y) x = x == y
contem (No l y r) x | x == y = True
                    | x < y = l `contem` x
                    | otherwise = r `contem` x

-- Record Type

data Ponto3D = Ponto' Double Double Double

coordX (Ponto' x _ _) = x
coordY (Ponto' _ y _) = y
coordZ (Ponto' _ _ z) = z

data Ponto3D' = Ponto { coordX' :: Double
                      , coordY' :: Double
                      , coordZ' :: Double
                      } deriving Show

data Void -- Void
--data () = () -- Unity ()

absurdo :: Void -> a
absurdo x = undefined

inteiro :: () -> Int
inteiro () = 42

fim :: a -> ()
fim x = ()

data Either' a b = Left a | Right b

type Bool' = Either () () -- 1 + 1

data Pair a b = Pair a b

type Cod_Prod = Either Char Char
type Valid_cod = Pair Char Bool

-- Tipo Exponencial

data Funcao a b = F (a -> b)
-- a -> b = b^a valores

main :: IO ()
main =
  putStrLn "hello world"
