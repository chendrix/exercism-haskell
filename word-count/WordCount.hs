module WordCount
( wordCount
) where
  
import Data.Map as M

wordCount :: String -> M.Map String Int
wordCount s = M.fromList $ zip (words s) (repeat 1)