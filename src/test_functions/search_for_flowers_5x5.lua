-- Tank-Abfrage
local tank = turtle.getFuelLevel()

if tank <= 10 then
    turtle.suckDown()
    turtle.getFuelLimit()
    turtle.refuel()
end

-- fährt nach vorne, bis sie etwas entdeckt
for i = 0, 20, 1 do
    if turtle.detect() then
        local hasBlock, data = turtle.inspect()

        if hasBlock and data.name == "minecraft:cornflower" then
            turtle.dig()
            turtle.turnLeft()
        else
            turtle.turnLeft()
        end

    else
        turtle.forward()
    end

    end
