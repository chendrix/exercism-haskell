module WordCount
( wordCount
) where
  
import Data.Map as M
import Data.List as L
import Data.Char as C

wordCount :: String -> M.Map String Int
wordCount phrase = L.foldr (\e m -> insertWith (+) e 1 m) startingMap tokens
  where isValidChar n = C.isSeparator n || C.isAlphaNum n
        s = L.filter isValidChar phrase
        tokens = words s
        startingMap = M.empty
