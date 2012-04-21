$LOAD_PATH.unshift '.'
require 'utils'

let(:p1) { Matrix.column_vector([4 , 1 , 3  , 0])  }
let(:p2) { Matrix.column_vector([0 , 2 , -1 , -1]) }

let(:p3) { Matrix.column_vector([2 , 3 , 0  , -2]) }
let(:p4) { Matrix.column_vector([1 , 1 , 2  , 1])  }

fun(:b)  { |g| (p2-p1) * g.to_f + p1 }
fun(:c)  { |m| (p4-p3) * m.to_f + p3 }

puts(b(0) == p1)
puts(b(1) == p2)

puts(c(0) == p3)
puts(c(1) == p4)

puts(b(0) + 3*c(1/3.0))

check(true) { b(0) == p1 }
