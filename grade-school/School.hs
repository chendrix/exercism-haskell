module School
( School(..)
, add
, empty
, sorted
, grade
) where
  
import Data.Maybe
import Data.List
import Data.Ord

type Grade = Int
type Student = String
type GradeRoster = (Grade, [Student])
type School = [GradeRoster]

add :: Grade -> Student -> School -> School
add g student school = (g, student : curStudents) : restRoster
  where (curRoster, restRoster) = partition (sameGrade g) school
        (foundGrade, curStudents) = findRoster g school

empty :: School
empty = []

sorted :: School -> School
sorted = sort . map sortedRoster

sortedRoster :: GradeRoster -> GradeRoster
sortedRoster (g, students) = (g, sort students)

grade :: Grade -> School -> [Student]
grade g s = students 
  where (_, students) = findRoster g s
  
findRoster :: Grade -> School -> GradeRoster
findRoster g s = fromMaybe (g, []) roster
  where roster = find (\(grade, students) -> grade == g) s

sameGrade :: Grade -> GradeRoster -> Bool
sameGrade g1 (g2, _) = g1 == g2

