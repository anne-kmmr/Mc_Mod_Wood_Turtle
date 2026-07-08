turtle.refuel()
local success, reason = turtle.forward()

print(turtle.getFuelLevel())
print(success)
print(reason)