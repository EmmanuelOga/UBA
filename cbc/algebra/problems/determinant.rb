$LOAD_PATH.unshift '.'
require 'utils'

a = Matrix[
  [1, 4, 5],
  [7, 2, 6],
  [8, 9, 3],
]

puts "det(A^t): #{a.transpose.determinant}\n\n"

puts "A' = A with 2nd row = 2nd row A + 3 first row A, 3rd row = first row A * k"

def b(a, k)
  Matrix[
    [a[0, 0],               a[0, 1],               a[0, 2]],
    [a[1, 0] + 3 * a[0, 0], a[1, 1] + 3 * a[0, 1], a[1, 2] + 3 * a[0, 2]],
    [a[2, 0] * k,           a[2, 1] * k,           a[2, 2] * k],
  ]
end

k = 1
puts "\n\ndet(A', k = #{k}): #{b(a, k).determinant} ( det(A) * #{k} = #{ a.determinant * k})"
puts b(a, k).table

k = 7
puts "\n\ndet(A', k = #{k}): #{b(a, k).determinant} ( det(A) * #{k} = #{ a.determinant * k})"
puts b(a, k).table
