module Sublist 
( Sublist(..)
, sublist
) where
  
import Data.List

data Sublist = Sublist | Equal | Superlist | Unequal deriving (Show, Eq)

sublist :: Eq a => [a] -> [a] -> Sublist
sublist a b
  | a == b = Equal
  | length a > length b && b `isInfixOf` a = Superlist
  | length a < length b && a `isInfixOf` b = Sublist
  | otherwise = Unequal