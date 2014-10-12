module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' g = foldr (flip g)

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr g z [] = z
foldr g z (x:xs) = x `g` foldr g z xs 

length :: [a] -> Int
length = foldr (\x -> (+) 1) 0 

reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map g (x:xs) = g x : map g xs

filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter g (x:xs) 
  | g x = x : filter g xs
  | otherwise = filter g xs

(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)

concat :: [[a]] -> [a]
concat = foldr (++) []
