$LOAD_PATH.unshift '.'
require 'utils'

a = Matrix[
  [ 1,  1],
  [ 2, -1],
]

def x(c, d)
  m_c = Matrix[
    [1.0, 0.5],
    [1.0, 0.0],
  ]
  m_d = Matrix[
    [1.0, 0.0],
    [0.0, 1.0],
  ]
  m_c * c + m_d * d
end

10.times do
  t = x(r((rand() * 1000).to_i, 1), r((rand() * 1000).to_i, 1))
  puts (t*a - a*t).zero?
end
