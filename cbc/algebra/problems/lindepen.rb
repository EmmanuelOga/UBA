$LOAD_PATH.unshift '.'
require 'utils'

def m(k)
  Matrix[
    [1 ,  0  ,  -1 ,      k - 2 ],
    [0 , -1  ,   0 ,          0 ],
    [0 ,  0  , k+1 ,         -3 ],
    [0 ,  0  ,   0 ,  -k**2+2*k ]
  ]
end

m(-1).wolfram!
