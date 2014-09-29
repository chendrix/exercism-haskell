module LeapYear (isLeapYear)
where
  isLeapYear :: Int -> Bool
  isLeapYear year
    | year `divisibleBy` 400 = True
    | year `divisibleBy` 100 = False
    | year `divisibleBy` 4   = True
    | otherwise = False
    
  divisibleBy :: Int -> Int -> Bool
  divisibleBy n d = mod n d == 0
