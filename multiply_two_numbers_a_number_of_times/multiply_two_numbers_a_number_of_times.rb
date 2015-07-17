# http://www.codewars.com/kata/multiply-two-numbers-a-number-of-times/ruby
#
# Description:
#   Write a function to multiply a number (x) by a given number (y) a certain number of times (n). The results are to be returned in an array.
#
# eg.
#   multiply_by(2, 4, 6)
#   The output is: [8, 32, 128, 512, 2048, 8192]
#
# NB: all arguments (x,y and n) will always be integers. Times (n) will always be a positive integer.

def multiply_by x,y,n
    (1..n).map {|i| x * y**i}
end

def multiply_by x,y,n
    Array.new(n) {x *= y}
end

def multiply_by x,y,n
  rst=[]
  n.times do
    rst << x *= y
  end
  rst
end

def multiply_by x,y,n
  rst = []
  n.times do |i|
    rst << x * y**(i+1)
  end
  rst
end
