$LOAD_PATH.unshift '.'
require 'utils'

a = Matrix[
  [ 1,  0,  3],
  [ 2,  2, -1],
  [-1,  0,  1],
]

b = Matrix[
  [2, 1, -1],
  [0, 1,  8],
  [0, 0, -1],
]

puts "|a|  = #{a.determinant}"
puts "|b|  = #{b.determinant}"
puts "|ab| = #{(a * b).determinant} (|a|*|b| = #{a.determinant*b.determinant})"
puts "|a+b| = #{(a + b).determinant}"
puts "|a^10| = #{(a**10).determinant} (|a|^10 = #{a.determinant**10})"
puts "|a^5b| = #{((a**5)*b).determinant} (|a|^5*|b| = #{a.determinant**5*b.determinant})"
puts "|a^5b - a^5| = #{((a**5)*b - a**5).determinant}"

puts((b - Matrix::I(3)).table)

a = Matrix[
  [2, 3, 1],
  [0, 0, 1],
  [1, 1, 1],
]

puts(a.determinant)
puts((a**-1).table)
