require 'bigdecimal'

# A frog jump half the distance from a to b, then half the previous distance,
# then half the previous distance, ... (Zeno of Elea)

one = BigDecimal("1")
distance = one / 2

2.upto(50) do |n|
  distance = distance + (one / 2**n)
  puts distance
end
