module Robot
( robotName
, mkRobot
, resetName
, randomName
) where

import Data.IORef
import System.Random
import Data.Char

type Name = String
data Robot = Robot { name :: Name } deriving (Show, Eq)

mkRobot :: IO (IORef Robot)
mkRobot = do
  n <- randomName
  newIORef Robot{name=n}

randomName :: IO Name
randomName = do
  g <- getStdGen
  h <- newStdGen
  let randomChars = randomRs ('A', 'Z') g
      randomNumbers = randomRs (0, 9) h :: [Int]
      twoChars = take 2 randomChars
      threeDigitString = foldr ((:) . intToDigit) [] (take 3 randomNumbers)
  return $ twoChars ++ threeDigitString 

robotName :: IORef Robot -> IO Name
robotName ref = do
  robot <- readIORef ref
  return (name robot)

resetName :: IORef Robot -> IO ()
resetName ref = do
  n <- randomName
  writeIORef ref Robot{name=n}
           