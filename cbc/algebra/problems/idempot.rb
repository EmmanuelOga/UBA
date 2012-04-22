$LOAD_PATH.unshift '.'
require 'utils'

banner "Si aa = a => (i - 2a) es inversible"

#   (i - 2a)(i - 2a)
# = ii - i2a - 2ai + 4aa
# = i - 4a + 4aa , pero aa = a
# = i - 4a + 4a
# = i
#
# Luego,
#
# (i - 2a)(i - 2a) = i
#
# Entonces i - 2a es inversible.

$header = true

i    = Matrix[ [1, 0], [0, 1] ]
idem = Matrix[ [1, 1], [0, 0] ]

check(idem, idem) { |a| a * a } # => aa == a

check(i, idem) do |a|
  puts( (i - 2 * a).table)
  puts(((i - 2 * a) ** 2).table)
  (i - 2 * a) ** 2
end
