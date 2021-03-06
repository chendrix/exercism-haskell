module Grains
( square
, total
) where
  
  square :: Integer -> Integer
  square n = 2 ^ (n - 1)
  
  total :: Integer
  total = sum $ map square [1..64]
  