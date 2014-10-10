module Phone
( prettyPrint
, areaCode
, number
) where

import Data.Char
import Text.Printf

prettyPrint :: String -> String
prettyPrint unformattedNumber = 
  printf "(%s) %s-%s" area prefix lineNumber
  where (area, rest) = splitAt 3 (number unformattedNumber)
        (prefix, lineNumber) = splitAt 3 rest

areaCode :: String -> String
areaCode phoneNumber = take 3 $ number phoneNumber

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
