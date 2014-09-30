module DNA (toRNA)
where
  
  toRNA :: String -> String
  toRNA = map nucleotideToRNA
  
  nucleotideToRNA :: Char -> Char
  nucleotideToRNA n = 
    case n of
      'G' -> 'C'
      'C' -> 'G'
      'T' -> 'A'
      'A' -> 'U'
      _   -> error "Unknown DNA Nucleotide"
