$LOAD_PATH.unshift '.'
require 'utils'

m = Matrix.parse(%Q{
  1 1 -2 -3
  0 1 1 5
  2 -2 1 1
})

m.wolfram!("RowReduce")
