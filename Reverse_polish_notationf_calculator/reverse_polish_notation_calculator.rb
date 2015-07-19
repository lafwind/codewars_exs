# Description:
#
# Your job is to create a calculator which evaluates expressions in Reverse Polish notation.
#
# For example expression 5 1 2 + 4 * + 3 - (which is equivalent to 5 + ((1 + 2) * 4) - 3 in normal notation) should evaluate to 14.
#
# Note that for simplicity you may assume that there are always spaces between numbers and operations, e.g. 1 3 + expression is valid, but 1 3+ isn't.
#
# Empty expression should evaluate to 0.
#
# Valid operations are +, -, *, /.
#
# You may assume that there won't be exceptional situations (like stack underflow or division by zero).

def calc(expr)
  expr.split.each_with_object([]) { |e, a|
    if e.match(/\d+/)
      a << e.to_f
    else
      y, x = a.pop, a.pop
      a << x.send(e, y)
    end
  }.last || 0
end

def calc(expr)
  tokens = expr.split
  return 0 unless tokens.any?
  stack = []
  tokens.each do |token|
    begin
      stack << Float(token)
    rescue
      stack << stack.pop(2).reduce(token)
    end
  end
  stack.last
end


def calc(expr)
  def calculator(arr, sym)
    t1, t2 = arr.pop, arr.pop
    arr.push t2.send(sym, t1)
  end

  tmp = []
  return 0 if expr.empty?

  expr.split.each do |e|
    if e == "+" || e == "-" || e == "*" || e == "/"
      calculator(tmp, e.to_sym)
    else
      tmp.push(e.to_f)
    end
  end

  tmp.last
end

str = "5 1 2 + 4 * + 3 -"
puts "Correct!" if calc(str) == 14
