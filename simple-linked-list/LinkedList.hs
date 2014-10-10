module LinkedList
( isNil
, nil
, datum
, next
, new
, fromList
, toList
, reverseLinkedList
) where
  
data List a = Element a (List a) | End

isNil :: List a-> Bool
isNil End = True
isNil (Element _ _) = False

nil :: List a
nil = End

datum :: List a -> a
datum End = error "Cannot call datum on an end element"
datum (Element x _) = x

next :: List a -> List a
next End = error "Cannot call next on an end element"
next (Element _ l) = l

new :: a -> List a -> List a
new = Element 

fromList :: [a] -> List a
fromList = foldr Element End

toList :: List a -> [a]
toList End = []
toList (Element x l) = x : toList l

reverseLinkedList :: List a -> List a
reverseLinkedList = fromList . reverse . toList