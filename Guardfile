guard :shell do
  watch /(.*).hs$/ do |m|
    puts "-[ Testing #{m[0]} ]-----------------------------"
    `runhaskell #{Dir["*_test.hs"].first}`
    
    puts "-[ Linting #{m[0]} ]-----------------------------"
    `hlint #{m[0]}`
  end
end
