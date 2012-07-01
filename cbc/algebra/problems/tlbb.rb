$LOAD_PATH.unshift '.'
require 'utils'

B = Matrix.parse %Q{
  1  0 0
 -1  2 0
  2 -1 1
}

B1 = Matrix.parse %Q{
 2  1
 1 -1
}

F = Matrix.parse %Q{
  1 -1  0
  1  1  1
}

FBB1 = B1.inverse * F * B

puts FBB1.table

fun(:bb1) do |x1, x2, x3|
  FBB1 * Matrix.column_vector([r(x1), r(x2), r(x3)])
end
