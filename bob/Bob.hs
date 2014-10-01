module Bob
( responseFor
) where
  
import Data.Char

responseFor :: String -> String
responseFor saying
  | all isSpace saying = "Fine. Be that way!"
  | allUpper saying = "Whoa, chill out!" 
  | saying `endsWith` '?' = "Sure."
  | otherwise = "Whatever."
  
endsWith :: String -> Char -> Bool
endsWith str char = last str == char

allUpper :: String -> Bool
allUpper str = 
  not (null alphaStr) && all isUpper alphaStr
  where alphaStr = filter isAlpha str 