$LOAD_PATH.unshift '.'
require 'utils'

# Ax = [1]
#      [4]
#      [1]
#      [1]

fun(:col) { |c1, c2, c3, c4|
  Matrix.column_vector([ r(c1), r(c2), r(c3), r(c4) ])
}

fails = 0

b = col(r(1), r(4), r(1), r(1))

c1 = col(0, 0, 0, 0)
c2 = r(-1) * b
c3 = r( 2) * b

xp = Matrix.column_vector([r(0), r(1), r(1)])
xs = Matrix.column_vector([r(0), r(2), r(1)])

a = Matrix.from_column_vectors([c1, c2, c3])

(-50..50).each do |w|
  c = r(w, 10)
  x = xp + (xs * c)
  s = a * x
  fails = fails + 1 if s != b
end

puts "fails: #{fails}"
