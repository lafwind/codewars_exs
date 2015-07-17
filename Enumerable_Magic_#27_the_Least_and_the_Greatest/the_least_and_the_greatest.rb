# Enumerable Magic #27 - The Least and the Greatest
#
# Create a method minmax that accepts a list and a block. The block itself should compare two elements, so the method can sort the elements and return the minimum and maximum as a 2-element array.
#
# Here's a simple example:
#
#   minmax([3,2,5,4]){|a,b| a <=> b}  #=> [2,5]
#   minmax([2,14,7,9]){|a,b| a.to_s <=> b.to_s}  #=> [14,9]
#   If you need help, here's a reference:
#
# http://www.rubycuts.com/enum-minmax

def minmax list, &block
  list.minmax(&block)
end

def minmax list, &block
  sorted = list.sort(&block)
  [sorted.first, sorted.last]
end

def minmax list, &block
  [list.min(&block), list.max(&block)]
end

def minmax(array, &block)
  block_given? ? array.sort(&block).values_at(0,-1) : "No block given"
end

def minmax list, &block
  list.sort!{|a,b|block.call(a,b)}
  [list[0],list[-1]]
end

def minmax list, &block
  rst = [list.first, list.first]
  list.each do |ele|
    rst[0] = ele if block.call(rst[0], ele) >= 0
    rst[-1] = ele if block.call(ele, rst[-1]) >= 0
  end
  rst
end

list = [13, 2, 5, 4]

puts minmax(list){|a,b| a <=> b}
