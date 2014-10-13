module ETL
( transform
) where

import qualified Data.Map.Strict as M
import Data.Char

type Score = Int
type Letter = String

type LegacySystem = M.Map Score [Letter]
type NewSystem = M.Map Letter Score

transform :: LegacySystem -> NewSystem
transform = M.foldrWithKey' addLettersScores M.empty
  where addLettersScores score letters scoreList = foldr (score `addLetterScore`) scoreList letters
        addLetterScore score letter = M.insert (downcase letter) score

downcase :: Letter -> Letter
downcase = map toLower
