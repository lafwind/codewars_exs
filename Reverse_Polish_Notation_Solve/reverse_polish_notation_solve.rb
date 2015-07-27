# Description:

# Finish the solvePostfix function. The input will be a postfix string and for ease the character will be seperated by a space. The function should return a Number. The solvePostfix function with the input string "12 4 2 ^ 5 +" Should return 2309. Operators Types = ("^","","/","+","-"). For more information on how to solve RPN read Reverse Polish Notation on wikipedia.

# *Once you have finished this one try the harder version http://www.codewars.com/kata/reverse-polish-notation-calculator/javascript

# Note: for simplicity's sake, assume that the "/" operator behaves like it usually does in the chosen language: float division in JS, integer division in both Ruby and Python 2 (the defaul Python on this site).

def solve_postfix(pfx)
  pfx.split.inject([]) do |a, e|
    if e[/\d/] then
      a << e.to_i
    else
      x = a.pop
      a << a.pop.method(e.sub("^","**").to_sym).(x)
    end
  end[0]
end

def solve_postfix(pfx)
  pfx.split.each_with_object([]) { |e, a|
    if e.match(/\d+/)
      a << e.to_i
    else
      e = "**" if e == "^"
      x, y = a.pop, a.pop
      if y == nil
        a << x
      else
        a << y.send(e, x)
      end
    end
  }.last || 0
end
