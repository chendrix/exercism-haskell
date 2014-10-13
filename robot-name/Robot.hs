module Robot
( robotName
, mkRobot
, resetName
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
  g <- newStdGen
  return $ _randomName g

_randomName :: StdGen -> Name
_randomName g = twoChars ++ threeDigitString 
  where randomChars = randomRs ('A', 'Z') g
        randomNumbers = randomRs (0, 9) g :: [Int]
        twoChars = take 2 randomChars
        threeDigitString = map intToDigit $ take 3 randomNumbers

robotName :: IORef Robot -> IO Name
robotName ref = do
  robot <- readIORef ref
  return (name robot)

resetName :: IORef Robot -> IO ()
resetName ref = do
  n <- randomName
  writeIORef ref Robot{name=n}
           