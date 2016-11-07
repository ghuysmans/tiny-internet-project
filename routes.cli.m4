include(topo.cli.m4)
sim run

define(`SHOW', `print "`$1'($2) is ip_$1($2)\n"
net node ip_$1($2) show rt *')
SHOW(`Spring', 1)
SHOW(`Spring', 3)
