$LOAD_PATH.unshift '.'
require 'utils'

m = Matrix.parse(%Q{
  0 1 -1
  1 0  1
  1 1  0
  0 1 -1
})

m.wolfram!
m.transpose.wolfram!
