module Phone
( prettyPrint
, areaCode
, number
) where

import Data.Char

prettyPrint :: String -> String
prettyPrint unformattedNumber = 
  "(" ++ area ++ ") " ++ first ++ "-" ++ second
  where area   = areaCode unformattedNumber
        first  = firstPart unformattedNumber
        second = secondPart unformattedNumber

areaCode :: String -> String
areaCode phoneNumber = take 3 $ number phoneNumber

firstPart :: String -> String
firstPart phoneNumber = drop 3 $ take 6 $ number phoneNumber

secondPart :: String -> String
secondPart phoneNumber = drop 3 $ drop 3 $ number phoneNumber

number :: String -> String
number str 
 | len == 11 && first == '1' = drop 1 digits
 | len == 10 = digits
 | otherwise = "0000000000"
 where digits = filter isDigit str
       len    = length digits
       first  = head digits
