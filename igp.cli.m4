include(shortcuts.m4)
define(`Big', 1)
define(`ip_Big', 1.0.0.$1)
divert dnl
net add domain Big igp
NODE(`Big', 1, 8)
NODE(`Big', 2, 8)
NODE(`Big', 3, 8)
NODE(`Big', 4, 8)
net domain Big compute
ILINK(`Big', 1, 3, 10)
ILINK(`Big', 2, 4, 10)
ILINK(`Big', 1, 2, 0)
ILINK(`Big', 3, 4, 0)
sim run
ROUTES(`Big', 2)
