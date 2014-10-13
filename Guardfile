guard :shell, all_on_start: true do
  watch /(.*).hs$/ do |m|
    test = Dir["*_test.hs"].first
    puts "-[ Testing #{m[0]} | #{test} ]-----------------------------"
    `runhaskell -Wall #{Dir["*_test.hs"].first}`
    
    puts "-[ Linting #{m[0]} ]-----------------------------"
    `hlint #{m[0]}`
  end
end
