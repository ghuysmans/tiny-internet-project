include(topo.cli.m4)

bgp router ip_Abilene(1)
	peer ip_Spring(3) IS_A_PROVIDER
	peer ip_GEANT(1) IS_A_PEER
	exit
bgp router ip_Abilene(3)
	peer ip_GEANT(3) IS_A_PEER
	exit
bgp router ip_BELNET(1)
	peer ip_GEANT(3) IS_A_PROVIDER
	exit
bgp router ip_BELNET(2)
	peer ip_GEANT(4) IS_A_PROVIDER
	peer ip_BigCarrier(2) IS_A_PROVIDER
	exit
bgp router ip_CERN(1)
	peer ip_Abilene(3) IS_A_PROVIDER
	peer ip_GEANT(3) IS_A_PROVIDER
	exit
bgp router ip_GEANT(1)
	peer ip_Abilene(1) IS_A_PEER
	peer ip_BigCarrier(3) IS_A_PROVIDER
	peer ip_BigCarrier(4) IS_A_PROVIDER
	exit
bgp router ip_GEANT(2)
	peer ip_BigCarrier(1) IS_A_PROVIDER
	exit
bgp router ip_GEANT(3)
	peer ip_Abilene(3) IS_A_PEER
	exit
bgp router ip_UCLA(1)
	peer ip_Spring(3) IS_A_PROVIDER
	peer ip_Abilene(2) IS_A_PROVIDER
	exit
bgp router ip_UCLA(2)
	peer ip_Abilene(2) IS_A_PROVIDER
	exit
bgp router ip_UCL(1)
	peer ip_BELNET(1) IS_A_PROVIDER
	exit
bgp router ip_UCL(2)
	peer ip_BELNET(2) IS_A_PROVIDER
	exit

sim run
bgp assert reachability-ok
