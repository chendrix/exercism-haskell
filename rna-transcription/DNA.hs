module DNA (toRNA)
where
  
  toRNA :: String -> String
  toRNA = map nucleotideToRNA
  
  nucleotideToRNA :: Char -> Char
  nucleotideToRNA 'G' = 'C'
  nucleotideToRNA 'C' = 'G'
  nucleotideToRNA 'T' = 'A'
  nucleotideToRNA 'A' = 'U'
  nucleotideToRNA _ = error "Unknown DNA Nucleotide"
