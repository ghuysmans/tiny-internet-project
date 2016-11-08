include(shortcuts.m4)
define(`Big', 1)
define(`Small', 2)
define(`ip_Big', 1.0.0.$1)
define(`ip_Small', 2.0.0.$1)
divert dnl
net add domain Big igp
NODE(`Big', 1, 8)
NODE(`Big', 2, 8)
net add domain Small igp
NODE(`Small', 1, 8)
ILINK(`Big', 1, 2, 0)
net domain Big compute
net domain Small compute
LINK(`Small', 1, `Big', 1, 2)
sim run
PEERS(`Big', 1)
PEERS(`Big', 2)
ROUTES(`Big', 2)
ROUTES(`Big', 1)
PING(`Big', 1, `Small', 1)
PING(`Big', 2, `Small', 1)
bgp assert peerings-ok
bgp assert reachability-ok
