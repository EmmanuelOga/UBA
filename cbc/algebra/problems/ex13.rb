$LOAD_PATH.unshift '.'
require 'utils'

G = Matrix.parse %Q{
  1 -1  0
  0  0  1
 -1  0  1
  1  0  0
}

fun(:g) { |x1, x2, x3| (G * Matrix.column_vector([x1, x2, x3])).transpose }

IF = Matrix.parse %Q{
  0 0 0 0
  0 0 0 0
  0 0 0 0
  0 0 0 1
}

IBF = Matrix.parse(%Q{
  1 0 -1 1
 -1 0  0 0
  0 1  1 0
  0 0  0 2
}).transpose.inverse

puts IBF.table

fun(:f) { |x1, x2, x3, x4| IF * IBF * Matrix.column_vector([x1, x2, x3, x4]) }

fun(:fog) { |x1, x2, x3| f(*g(x1, x2, x3).to_a.flatten) }

puts fog(-1298729, 298987, 389798).table
