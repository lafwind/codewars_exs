// http://www.codewars.com/kata/multiply-two-numbers-a-number-of-times/ruby
//
// Description:
//   Write a function to multiply a number (x) by a given number (y) a certain number of times (n). The results are to be returned in an array.
//
// eg.
//   multiply_by(2, 4, 6)
//   The output is: [8, 32, 128, 512, 2048, 8192]
//
// NB: all arguments (x,y and n) will always be integers. Times (n) will always be a positive integer.

function multiplyBy(x, y, n) {
  return Array.apply(null, Array(n)).map(function() {
    return x *= y;
  });
};

function multiplyBy(x, y, n) {
  var rst = [];
  while (n > 0) {
    x *= y;
    rst.push(x);
    n--;
  }
  return rst;
};
