# coding: utf-8
def exp_sum(sum)
  return 0 if num < 0

  lower_nums = (1..num)
  possibilities = Array.new num + 1, 0
  possibilities[0] = 1

  lower_nums.each do |lower_num|
    0.upto(num - lower_num) do |index|
      possibilities[index + lower_num] += possibilities[index]
    end
  end

  possibilities.last
end
