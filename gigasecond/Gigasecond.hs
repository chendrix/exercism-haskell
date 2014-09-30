module Gigasecond
( fromDay
) where
  
  import Data.Time.Calendar
  import Data.Time.Clock
  
  fromDay :: Day -> Day
  fromDay day = utctDay $ addUTCTime (10 ^ 9) $ UTCTime day 0
