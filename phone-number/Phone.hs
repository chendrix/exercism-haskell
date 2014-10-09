module Phone
( prettyPrint
, areaCode
, number
) where

import Data.Char
import Text.Printf

prettyPrint :: String -> String
prettyPrint unformattedNumber = 
  printf "(%s) %s-%s" area first second
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
 | validWithTrunkCode = tail digits
 | validWithoutTrunkCode = digits
 | otherwise = "0000000000"
 where digits = filter isDigit str
       len = length digits
       first  = head digits
       validWithTrunkCode = len == 11 && first == '1'
       validWithoutTrunkCode = len == 10
