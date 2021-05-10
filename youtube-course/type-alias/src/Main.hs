module Main where

type Produto = (Integer, String, Double)
type Cliente = (Integer, String, Double)

preco :: Produto -> Double
preco (_,_, p) = p

pago :: Cliente -> Double 
pago (_,_, p) = p

atualizaPreco :: Produto -> Double -> Produto
atualizaPreco (idProd, nome, preco) inflacao = (idProd, nome, preco * (1 + inflacao))

troco :: Produto -> Cliente -> Double 
troco p c = pago c - preco p

type Assoc k v = [(k, v)]

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k', v) <- t, k' == k]

main :: IO ()
main = do
  putStrLn "hello world"
