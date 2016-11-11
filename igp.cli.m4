include(shortcuts.m4)
define(`Big', 1)
define(`ip_Big', 1.0.0.$1)
divert dnl
net add domain Big igp
NODE(`Big', 1, 8)
NODE(`Big', 2, 8)
NODE(`Big', 3, 8)
NODE(`Big', 4, 8)
ILINK(`Big', 1, 3, 1)
ILINK(`Big', 2, 4, 1)
ILINK(`Big', 1, 2, 1)
ILINK(`Big', 3, 4, 1)
net domain Big compute
sim run
ROUTES(`Big', 2)
PING(`Big', 2, `Big', 4)
PING(`Big', 3, `Big', 4)
PING(`Big', 2, `Big', 3)
