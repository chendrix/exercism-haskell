module Anagram
( anagramsFor
) where
  
import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter $ isAnagram (downcase word) . downcase

isAnagram :: String -> String -> Bool
isAnagram word anagram 
  | word == anagram = False
  | otherwise = sort word == sort anagram
  
downcase :: String -> String
downcase = map toLower
