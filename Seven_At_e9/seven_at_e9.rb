# Write a function that removes each 9 that is surrounded by two 7s.

# seven_ate9('79712312') => '7712312'
# seven_ate9('79797') => '777'
# Input: String Output: String

def seven_ate9(str)
 s.gsub(/797/,"77").gsub(/797/,"77")
end

def seven_ate9(str)
  arr = str.chars
  str.chars.each_with_index do |char, idx|
    if char == "9" && idx > 0 && arr[idx - 1] == "7" && arr[idx + 1] == "7"
      arr[idx] = ""
    end
  end
  arr.join
end

result = seven_ate9('165561786121789797')
if result == '16556178612178977'
  puts "correct!!!"
else
  puts result
end

result = seven_ate9('797979')
if result == '7777'
  puts "correct!!!"
else
  puts result
end
