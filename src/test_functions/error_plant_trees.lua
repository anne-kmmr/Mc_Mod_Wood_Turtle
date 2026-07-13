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

local sapling = {
    ["minecraft:oak_log"] = "minecraft:oak_sapling",
    ["minecraft:spruce_log"] = "minecraft:spruce_sapling",
    ["minecraft:birch_log"] = "minecraft:birch_sapling",
    ["minecraft:jungle_log"] = "minecraft:jungle_sapling",
    ["minecraft:acacia_log"] = "minecraft:acacia_sapling",
    ["minecraft:dark_oak_log"] = "minecraft:dark_oak_sapling",
    ["minecraft:mangrove_log"] = "minecraft:mangrove_propagule",
    ["minecraft:cherry_log"] = "minecraft:cherry_sapling"
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

function cutSideBranches()
    for i = 1, 4 do
        local found, block = turtle.inspect()

        if found and wood[block.name] then
            turtle.dig()
        end

        turtle.turnRight()
    end
end

function moveForwardAndDig()
    checkFuel()

    while true do
        local found, block = turtle.inspect()

        if not found then
            turtle.forward()
            return true
        end

        if wood[block.name] then
            turtle.dig()
            turtle.forward()
            local height = 0

            while true do
                cutSideBranches()
                local foundUp, blockUp = turtle.inspectUp()

                if foundUp and wood[blockUp.name] then
                    turtle.digUp()
                    turtle.up()
                    height = height + 1
                else
                    break
                end
            end

            for i = 1, height do
                turtle.down()
            end

            sleep(0.2)
            turtle.forward()

            local wanted = sapling[block.name]

            for slot = 1, 16 do
                local item = turtle.getItemDetail(slot)

                if item and item.name == wanted then
                    turtle.select(slot)
                    turtle.turnLeft()
                    turtle.turnLeft()
                    turtle.place()
                    turtle.turnLeft()
                    turtle.turnLeft()
                    break
                end
            end

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
        turtle.suck()
        turtle.forward()
        turtle.turnLeft()

    else
        turtle.turnRight()
        turtle.suck()
        turtle.forward()
        turtle.turnRight()

    end
end

for row = 1,rows do
    for x = 1,width -1 do
        moveForwardAndDig()
    end

    if row < rows then
        if row % 2 == 1 then
            changeRow("left")

        else
            changeRow("right")
        end
    end
end