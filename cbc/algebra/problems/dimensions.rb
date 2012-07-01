$LOAD_PATH.unshift '.'
require 'utils'

v1 = Matrix.column_vector([ 3, 2, 1, -1])
v2 = Matrix.column_vector([-1, 2, 0,  1])
v3 = Matrix.column_vector([ 0, 0, 1,  0])
v4 = Matrix.column_vector([ 0, 0, 0,  1])

# A linear transformation is defined by the values associated to each vector
# on a basis of a vector space.

t1 = Matrix.column_vector([ 0, 0, 1,  0])
t2 = Matrix.column_vector([ 0, 0, 1,  0])
t3 = Matrix.column_vector([ 0, 0, 0,  0])
t4 = Matrix.column_vector([ 4, 0, 1, -2])

# Each factor as combination of x1, x2, x3 and x4.
fun(:a) {|x1, x2, x3, x4| r(     x1, 4) + r(x2, 8)    }
fun(:b) {|x1, x2, x3, x4| r( 3 * x2, 8) - r(x1, 4)    }
fun(:c) {|x1, x2, x3, x4| r(-2 * x1 - x2 + 8 * x3, 8) }
fun(:d) {|x1, x2, x3, x4| r( 2 * x1 - x2 + 4 * x4, 4) }

fun(:basis_change) do |x1, x2, x3, x4|
  v1 * a(x1, x2, x3, x4) +
  v2 * b(x1, x2, x3, x4) +
  v3 * c(x1, x2, x3, x4) +
  v4 * d(x1, x2, x3, x4)
end

# Each x1..4 is expressable as a combination of v1..4
puts(basis_change(1, 1, 1, 1).table) # Should output 1,1,1,1
puts(basis_change(1, 2, 3, 4).table) # Should output 1,2,3,4 etc.

fun(:lt) do |x1, x2, x3, x4|
  puts [x1, x2, x3, x4, " ---> ", a(x1, x2, x3, x4)].join(" ")
  puts [x1, x2, x3, x4, " ---> ", b(x1, x2, x3, x4)].join(" ")
  puts [x1, x2, x3, x4, " ---> ", c(x1, x2, x3, x4)].join(" ")
  puts [x1, x2, x3, x4, " ---> ", d(x1, x2, x3, x4)].join(" ")

  a(x1, x2, x3, x4) * t1 +
  b(x1, x2, x3, x4) * t2 +
  c(x1, x2, x3, x4) * t3 +
  d(x1, x2, x3, x4) * t4
end

puts "tl of v1"; puts(lt(*(v1.to_a.flatten)).transpose.table) # Should output t1
puts "tl of v2"; puts(lt(*(v2.to_a.flatten)).transpose.table) # Should output t2
puts "tl of v3"; puts(lt(*(v3.to_a.flatten)).transpose.table) # Should output t3
puts "tl of v4"; puts(lt(*(v4.to_a.flatten)).transpose.table) # Should output t4

Matrix.parse(%Q{
 #{r( 1, 4)*8} #{r( 1, 8)*8} #{r(0)*8} #{r(0)*8}
 #{r(-1, 4)*8} #{r( 3, 8)*8} #{r(0)*8} #{r(0)*8}
 #{r( 1, 2)*8} #{r(-1, 4)*8} #{r(0)*8} #{r(1)*8}
})

1.upto(10) do |x3|
  puts lt(0, 0, x3, 0).transpose.table
end

puts "LT 4 0 1 -2"
puts lt(4, 0, 1, -2).transpose.table
puts lt(4 * 2, 0 * 2, 1 * 2, -2 * 2).transpose.table
puts lt(4 * 2, 0 * 2, 1 * 2 + 4000, -2 * 2).transpose.table
puts lt(*(1..4).map {rand(1000)}).transpose.table
