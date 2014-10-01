module DNA
( nucleotideCounts
, count
) where

import qualified Data.Map as Map

type Nucleotide = Char
type Frequency = Int
type NucleotideCount = Map.Map Nucleotide Frequency

nucleotideCounts :: String -> NucleotideCount
nucleotideCounts = foldl increaseFrequency emptyNucleotidesCount

increaseFrequency :: NucleotideCount -> Nucleotide -> NucleotideCount
increaseFrequency freqs nucleotide = Map.insertWith (+) nucleotide 1 freqs

emptyNucleotidesCount :: NucleotideCount
emptyNucleotidesCount = Map.fromList $ zip nucleotides [0,0..]

nucleotides :: String
nucleotides = "ACTG"

count :: Nucleotide -> String -> Frequency
count nucleotide string
  | nucleotide `notElem` nucleotides = error $ "invalid nucleotide " ++ show nucleotide
  | otherwise = length $ filter (== nucleotide) string
