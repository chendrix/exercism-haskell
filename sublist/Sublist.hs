module Sublist 
( Sublist(..)
, sublist
) where
  
  import Data.List
  
  data Sublist = Sublist | Equal | Superlist | Unequal deriving (Show, Eq)
  
  sublist :: Eq a => [a] -> [a] -> Sublist
  sublist a b
    | a == b = Equal
    | null a = Sublist
    | null b = Superlist
    | length a > length b && b `isSubsetOf` a = Superlist
    | length a < length b && a `isSubsetOf` b = Sublist
    | otherwise = Unequal
    
  isSubsetOf :: Eq a => [a] -> [a] -> Bool
  isSubsetOf smaller larger = elem smaller $ sliceIntoChunks larger $ length smaller
  
  sliceIntoChunks :: [a] -> Int -> [[a]]
  sliceIntoChunks list size = map (take size) (tails list)