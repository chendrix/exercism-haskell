module SpaceAge
( Planet(..)
, ageOn
) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Int -> Float
ageOn planet seconds = fromIntegral seconds / secondsPerYear planet

secondsPerYear :: Planet -> Float
secondsPerYear planet =
  case planet of
    Earth   -> 31557600
    Mercury -> 0.2408467  * secondsPerYear Earth
    Venus   -> 0.61519726 * secondsPerYear Earth
    Mars    -> 1.8808158  * secondsPerYear Earth
    Jupiter -> 11.862615  * secondsPerYear Earth
    Saturn  -> 29.447498  * secondsPerYear Earth
    Uranus  -> 84.016846  * secondsPerYear Earth
    Neptune -> 164.79132  * secondsPerYear Earth
