$LOAD_PATH.unshift '.'
require 'utils'

banner "(A + B) power 2"

$header = true
10.times do
  a = Matrix.build(4) { (rand() * 10).to_i }
  b = Matrix.build(4) { (rand() * 10).to_i }

  check((a + b) ** 2, a, b) { |a, b| a**2 + b*a + a*b + b**2 }
  $header = false
end

banner "(A + B) power 3"

$header = true
10.times do
  a = Matrix.build(4) { (rand() * 10).to_i }
  b = Matrix.build(4) { (rand() * 10).to_i }

  check((a + b) ** 3, a, b) do |a, b|
    a**3 + b*a**2 + a*b*a + b**2*a + a**2*b + b*a*b + a*b**2 + b**3
  end

  $header = false
end
