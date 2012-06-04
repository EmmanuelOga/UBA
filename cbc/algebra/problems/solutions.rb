$LOAD_PATH.unshift '.'
require 'utils'

# All solutions to:
#
# 1x -2y -2z = b1
# 2x -5y -4z = b2
# 4x -9y -8z = b3

let(:a) {
  Matrix[[r(1), r(-2), r(-2)],
         [r(2), r(-5), r(-4)],
         [r(4), r(-9), r(-8)]]
}

# All solutions will be of the form:
#
# [ 5b1 - 2b2 ]  + [2]c
# [ 2b1 - b2  ]    [0]
# [ 0         ]    [1]
#
# with the condition that -2b1 - b2 + b3 == 0
fun(:solution) { |b1, b2, b3, c|
  Matrix.column_vector([ r(5) * r(b1) - r(2) * r(b2), r(2) * r(b1) - r(b2), 0.0 ]) +
  (Matrix.column_vector([ r(2), r(0), r(1)]) * r(c))
}

puts "Particular solution, b3 == 0"

fails = 0
(-5..5).each do |b1|
  (-5..5).each do |b2|
    b3 = 0

    (-50..50).each do |w|
      c = r(5, 10)

      b = Matrix.column_vector([b1, b2, b3])
      x = solution(b1, b2, 0, c)

      fails = fails + 1 if ((r(-2)*b1 - b2 + b3) == 0) && (a * x != b)
    end
  end
end

puts "fails: #{fails}"
puts

puts "All solutions."
fails = 0

(-5..5).each do |b1|
  (-5..5).each do |b2|
    (-5..5).each do |b3|
      if (r(-2) * r(b1) - r(b2) + r(b3)) == 0 # There only will be a solution if this stands.

        # If the condition holds, there will be infinite solutions.
        (-50..50).each do |w|
          c = r(5, 10)

          b = Matrix.column_vector([b1, b2, b3])
          x = solution(b1, b2, b3, c)

          fails = fails + 1 if a*x != b
        end

      end
    end
  end
end

puts "fails: #{fails}"
puts

puts "Example: "

b1 = r( 1) # b1 = r(2)
b2 = r(-1) # b2 = r(-4)
b3 = r( 1) # b3 = r(0)

c = r(100)
b = Matrix.column_vector([b1, b2, b3])
x = solution(b1, b2, b3, c)

puts "\na"
puts a.table

puts "\nx"
puts x.table

puts "\na*x"
puts (a * x).table

puts "\nb"
puts b.table
