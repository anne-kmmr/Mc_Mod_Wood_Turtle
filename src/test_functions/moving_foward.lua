--[[ Testobjekt: 9x9 Feld mit 9 Bäumen -> Muster 1x Baum + 2 Blöcke Abstand = nächster Baum
Anfangspunkt Turtle: 1 Block Abstand zum ersten Baum, nach außen verlagerter Extrapunkt mit Kohlekiste unten drunter
Dokumentation: https://tweaked.cc/module/turtle.html
]]

--[[ Feld-Darstellung in Worten
Turtle & Kiste mit Kohle darunter (mehrere Stacks)
-
Baum    -   Baum    -   Baum
-       -   -       -   Baum
Baum    -   Baum    -   Baum
-       -   -       -   Baum
Baum    -   Baum    -   Baum
]]

-- erst auftanken
turtle.suckDown()
turtle.select(1)
turtle.refuel()

-- dann jeweils schritte laufen und alle bäume ablaufen (vorerst)
turtle.forward()
local round = 0

while round <= 3 do
    for i = 1, 7, 1 do
        turtle.forward()

        if i >= 7 then
            turtle.turnLeft()
        end
    end
    round = round + 1
end

if round >= 3 then
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
end

-- testschritte
local success, reason = turtle.forward()
print(success)
print(reason)



--[[Probleme als Mitnahmemöglichkeit für die main
- muss immer schauen, dass er richtig herum ist
- sollte erkennen, wann er wirklich tanken muss
- sollte automatisiert immer so lange fahren, bis er einen bestimmten gegenstand vor sich findet und dementsprechend
aufhört
- sollte universal für alle felder einsetzbar sein

]]
