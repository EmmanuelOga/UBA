$LOAD_PATH.unshift '.'
require 'utils'

IBF = Matrix.parse(%Q{
  1 0 0
  1 1 0
 -2 0 1
}).inverse

IF = Matrix.parse(%Q{
  0 0 0
  0 2 0
  0 0 3
})

fun(:f) { |x, y, z| IF * IBF * Matrix.column_vector([x, y, z]) }

puts f(1 * 1e-16, 1 * 1e-16, -2 * 1e-16).table
