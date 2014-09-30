module SumOfMultiples
( sumOfMultiplesDefault
, sumOfMultiples
) where
  
  sumOfMultiplesDefault :: Int -> Int
  sumOfMultiplesDefault = sumOfMultiples [3, 5]
  
  sumOfMultiples :: [Int] -> Int -> Int
  sumOfMultiples list n = sum $ filter (`divisibleByAny` list) [0..n-1]
  
  
  divisibleByAny :: Int -> [Int] -> Bool
  divisibleByAny n = any (n `divisibleBy`)
  
  divisibleBy :: Int -> Int -> Bool
  divisibleBy n d = mod n d == 0