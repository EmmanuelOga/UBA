$LOAD_PATH.unshift '.'
require 'utils'

banner "a = x*Transpose(x) ==> a == Tanspose(a) (symmetric)"

$header = true
10.times do
  x = Matrix.build(4) { (rand() * 10).to_i }
  a = x * x.transpose

  check(a, a) { |a| a.transpose }
  $header = false

  puts a.table
end
