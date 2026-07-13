# 🌲 Mc_Mod_Wood_Turtle

Automatisierte Holzfarm-Turtle für **Minecraft mit CC:Tweaked**.

Dieses Projekt enthält ein Lua-Programm für eine Turtle, die automatisch eine definierte Farm abfährt, Holz abbaut, Ressourcen sammelt und diese anschließend an einer Sammelstation abgibt.


---

## ✨ Features

* Automatische Holzernte
* Unterstützung aller Holzarten 
* Automatische Bewegung über mehrere Reihen
* Serpentinen-Fahrmuster für maximale Flächennutzung
* Automatische Rückfahrt zur Abgabestation
* Abgabe gesammelter Items über Hopper
* Brennstoffprüfung und automatisches Nachfüllen von Kohle/Saplings

---

# 📦 Voraussetzungen

## Minecraft

Benötigt:

* Minecraft Java Edition
* CC:Tweaked

Empfohlene Version:

```
Minecraft 1.20+
CC:Tweaked 1.100+
```

---

# 🛠 Installation

## 1. CC:Tweaked installieren



---

## 2. Turtle vorbereiten



---

## 3. Script herunterladen & installieren



---

# 🌱 Aufbau der Farm

Die Farm sollte im besten Fall so aufgebaut sein:

Fehlendes Bild!


Wichtig:

* Das Feld muss frei befahrbar sein
* Zäune oder Begrenzungen müssen korrekt gesetzt sein
* Der Hopper muss dort stehen, wo die Turtle ihre Items abgibt

---

# ⚙ Konfiguration

## Reihenanzahl

Beispiel:

```lua
local rows = 10
```

Die Turtle fährt 10 Reihen ab. Diese Zahl kann verändert werden, sollte jedoch min. 2 oder eine gerade
Zahl sein, sodass das Serpentinen-Fahrmuster auf der Farm anwendbar ist.

---



---

## Holzarten

Die zu sammelnden Blöcke werden über eine Liste definiert:

```lua
local wood = {
    ["minecraft:oak_log"] = true,
    ["minecraft:spruce_log"] = true,
    ["minecraft:birch_log"] = true,
    ...
}
```

Durch "false" statt "true" kann das Sammeln von bestimmten Holzarten ausgeschlossen werden.

---

# ▶ Benutzung

## Script ausführen

Rechtsklick auf die Turtle und folgenden Befehl eintippen/ausführen:

```
wood_turtle
```

Die Turtle beginnt anschließend automatisch mit dem Farmen. Nach Beendung des Durchlaufs wartet sie auf
einen erneuten Start.

---

## Ablauf

1. Turtle startet an der Station nach Ausführung des Scripts
3. Fährt Reihe für Reihe ab und wendet am Ende jeder Reihe
   4. Sammelt Holz, bewegt sich (bei Bedarf) nach oben/unten und sammelt Holz am Stamm im Radius von einem Block
5. Fährt zurück zur Station
6. Gibt Items über den Hopper an Kiste ab
7. Färt auf Station, dreht sich und wartet auf ein erneutes Ausführen

---

# ⚠️ Benutzungshinweise

## Ausreichender Nachschub Kohle/Saplings
In der Kiste am Startpunkt müssen zu jederzeit genug Kohle als auch Saplings liegen.
Andernfalls kann es sein, dass die Turtle plötzlich stehen bleibt oder keine neuen Bäume mehr pflanzt.

## Problematik großer Bäume
Große Bäume (z.B. Jungle/Cherry) haben meist Zweige, welche vom Stamm wegführen. Die Turtle baut den Stamm
und jegliches Holz ab, welches sich im 1-Block-Radius um den Stamm herum befindet. Große Bäume könnten daher
nicht vollständig abgebaut werden. Dies sollte bei der Auswahl der Saplings als auch der ersten Bäume beachtet
werden.

## Ausrichtung der Bäume
Die Bäume dürfen nicht direkt am Zaun oder im Drehradius der Turtle stehen, da diese sonst möglicherweise 
nur den untersten Block abbaut oder sich verwirrt im Kreis dreht und in eine falsche Richtung fährt.



---

# ❕Hinweis

Diese Turtle wurde mithilfe der Dokumentation von TweakedCC erstellt, zu finden hier:
https://tweaked.cc/module/turtle.html

---

# 📄 Lizenz

Dieses Projekt steht unter der MIT-Lizenz.

---

# 👤 Autor

**anne-kmmr** (https://github.com/anne-kmmr)
