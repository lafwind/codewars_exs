# Description:

# For the numbers 1 to 1000, count how many times each number can be divided evenly with the numbers ranging from 1 to 25.
# For example, in the range of 1-1000, there are 1000 numbers that are evenly divided by the number 1. There are 500 numbers in that range that divide evenly by 2, and so forth.
# Your function should return a hash where they keys are the numbers from 1-25, and the values are the count.

# For example:
# { 1: 1000, 2: 500, ... 25: ? }

def count_divisors
  (1..25).map { |i| [i, 1000/i] }.to_h
end

def count_divisors
  h = {}
  1.upto(25) do |x|
    h[x] = 1000 / x
  end
  h
end
