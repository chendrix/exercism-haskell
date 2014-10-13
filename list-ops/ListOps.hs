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
foldl' g z [] = z
foldl' g z (x:xs) = let z' = z `g` x
                    in seq z' $ foldl' g z' xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr g z [] = z
foldr g z (x:xs) = x `g` foldr g z xs

length :: [a] -> Int
length = foldl' (\n _ -> n + 1) 0 

reverse :: [a] -> [a]
reverse = foldl' (flip (:)) []

map :: (a -> b) -> [a] -> [b]
map g = foldr ((:) . g) []

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\x xs -> if p x then x:xs else xs) []

(++) :: [a] -> [a] -> [a]
(++) xs ys = foldr (:) ys xs

concat :: [[a]] -> [a]
concat = foldr (++) []
