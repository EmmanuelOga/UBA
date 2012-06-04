#
# entrance |------------------------------| door
#
# An employee walks from entrance to door, a fly departs from his head to the
# door and back to the head of the employee continuosly until the employee
# reaches the door. What's the total distance traveled by the fly?
#

Ve = 2   # Velocity employee
Vf = 10  # Velocity Fly
D  = 30  # Distance from entrance to door.

def x_employee(t)
  Ve * t
end

def x_fly(x0, t0, v, t)
  x0 + v * (t - t0)
end

def time_fly_to_door(t0)
  (d - x0) / v + t0
end

df = 0
xn, tn, t = 0, 0, 0

