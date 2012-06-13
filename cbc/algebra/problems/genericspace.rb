$LOAD_PATH.unshift '.'
require 'utils'

v1 = Matrix.row_vector([1, 0, 0, 0])
v2 = Matrix.row_vector([0, 1, 0, 0])
v3 = Matrix.row_vector([0, 0, 1, 0])
v4 = Matrix.row_vector([0, 0, 0, 1])

k = 0
t1 = v1 + v2 - v3 + 2*v4
t2 = v1 - v3
t3 = 2*v1 + 3*v2 - 2*v3 + k*v4

tk = Matrix.from_row_vectors([t1, t2, t3])
tk.wolfram!("Nullspace")
