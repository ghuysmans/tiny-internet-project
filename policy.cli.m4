include(topo.cli.m4)

ROUTER(`Abilene', 1)
	PROVIDER(`Spring', 3)
	PEER(`GEANT', 1)
	exit
ROUTER(`Abilene', 3)
	PEER(`GEANT', 3)
	exit
ROUTER(`BELNET', 1)
	PROVIDER(`GEANT', 3)
	exit
ROUTER(`BELNET', 2)
	PROVIDER(`GEANT', 4)
	PROVIDER(`BigCarrier', 2)
	exit
ROUTER(`CERN', 1)
	PROVIDER(`Abilene', 3)
	PROVIDER(`GEANT', 3)
	exit
ROUTER(`GEANT', 1)
	PEER(`Abilene', 1)
	PROVIDER(`BigCarrier', 3)
	PROVIDER(`BigCarrier', 4)
	exit
ROUTER(`GEANT', 2)
	PROVIDER(`BigCarrier', 1)
	exit
ROUTER(`GEANT', 3)
	PEER(`Abilene', 3)
	exit
ROUTER(`UCLA', 1)
	PROVIDER(`Spring', 3)
	PROVIDER(`Abilene', 2)
	exit
ROUTER(`UCLA', 2)
	PROVIDER(`Abilene', 2)
	exit
ROUTER(`UCL', 1)
	PROVIDER(`BELNET', 1)
	exit
ROUTER(`UCL', 2)
	PROVIDER(`BELNET', 2)
	exit

sim run
bgp assert reachability-ok
