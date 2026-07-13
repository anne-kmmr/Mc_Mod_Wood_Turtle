local width = 10
local rows = 10

local wood = {
    ["minecraft:oak_log"] = true,
    ["minecraft:spruce_log"] = true,
    ["minecraft:birch_log"] = true,
    ["minecraft:jungle_log"] = true,
    ["minecraft:acacia_log"] = true,
    ["minecraft:dark_oak_log"] = true,
    ["minecraft:mangrove_log"] = true,
    ["minecraft:cherry_log"] = true,
    ["minecraft:pale_oak_log"] = true
}

local fence = {
    ["minecraft:oak_fence"] = true,
    ["minecraft:spruce_fence"] = true,
    ["minecraft:birch_fence"] = true,
    ["minecraft:jungle_fence"] = true,
    ["minecraft:acacia_fence"] = true,
    ["minecraft:dark_oak_fence"] = true,
    ["minecraft:mangrove_fence"] = true,
    ["minecraft:cherry_fence"] = true
}

function checkFuel()
    if turtle.getFuelLevel() == "unlimited" then
        return true
    end

    if turtle.getFuelLevel() > 50 then
        return true
    end

    for slot = 1,16 do
        turtle.select(slot)

        if turtle.refuel(0) then
            turtle.refuel()
            return true
        end
    end
    return false
end

function moveForward()
    checkFuel()

    while true do
        local found, block = turtle.inspect()

        if not found then
            turtle.forward()
            return true

        end

        if wood[block.name] then
            turtle.dig()
            sleep(0.2)

        elseif fence[block.name] then
            return false

        else
            turtle.dig()
        end
    end
end

function changeRow(direction)
    if direction == "left" then
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()

    else
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()

    end

end

for row = 1,rows do
    for x = 1,width -1 do
        moveForward()
    end

    if row < rows then
        if row % 2 == 1 then
            changeRow("left")

        else
            changeRow("right")
        end
    end
end