$LOAD_PATH.unshift '.'
require 'utils'

s = Matrix.parse %Q{
  2 -2
 -1  3
  4  0
  0  4
}

t = Matrix.parse %Q{
  1  0
  3  1
  1 -2
 -1 -2
}

spt = Matrix.parse %Q{
  2 -2  1  0 # = 3
 -1  3  3  1 # = 5
  4  0  1 -2 # = 7
  0  4 -1 -2 # = 1
}

d = r( 5)
a = r(11, 8) + r(5, 8) * d
b = r( 5, 8) + r(3, 8) * d
c = r( 3, 2) - r(1, 2) * d

xs = Matrix.column_vector([a, b])
xt = Matrix.column_vector([c, d])
x  = Matrix.column_vector([a, b, c, d])

puts "a= #{a}, b= #{b}, c=#{c}, d= #{d}"
puts "s"
puts (   s * xs         ).transpose.table
puts "t"
puts (   t * xt         ).transpose.table
puts "s+t"
puts (   s * xs + t * xt).transpose.table
puts "s+t"
puts ( spt * x          ).transpose.table
