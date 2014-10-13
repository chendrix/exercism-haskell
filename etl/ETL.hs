module ETL
( transform
) where

import qualified Data.Map.Strict as M
import Data.Char
import qualified Data.List as L

type Score = Int
type Letter = String

type LegacySystem = M.Map Score [Letter]
type NewSystem = M.Map Letter Score

transform :: LegacySystem -> NewSystem
transform = M.foldlWithKey' addLettersScores M.empty
  where addLettersScores scoreList score = L.foldl' (flip (addLetterScore score)) scoreList
        addLetterScore score letter = M.insert (downcase letter) score

downcase :: Letter -> Letter
downcase = map toLower
