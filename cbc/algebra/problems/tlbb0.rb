$LOAD_PATH.unshift '.'
require 'utils'

B = Matrix.parse %Q{
  1  0 0  0
 -1  2 0  0
  2 -1 2  0
  0  1 1 -1
}

Bp = Matrix.parse %Q{
  1 0 0
  0 1 0
  0 0 1
}

F = Matrix.parse %Q{
  1 0 -1 0
  0 0  0 2
  0 1  1 0
}

FBBp = Bp.inverse * F * B

puts FBBp.table

fun(:bb1) do |x1, x2, x3|
  FBB1 * Matrix.column_vector([r(x1), r(x2), r(x3)])
end
