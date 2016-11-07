divert(-1)
#shortcuts
define(`MORE', `bgp router $1 add network $2')
define(`NODE', `net add node ip_$1($2)
net node ip_$1($2) domain $1
bgp add router $1 ip_$1($2)
MORE(ip_$1($2), ip_$1(0)/$3)')
define(`BGP', `bgp router $1
	add peer $2 ip_$2($3)
	peer ip_$2($3) up
	exit')
define(`ILINK', `net add link ip_$1($2) ip_$1($3)
net link ip_$1($2) ip_$1($3) igp-weight --bidir $4')
BGP(ip_$1($2), `$1', $3)
BGP(ip_$1($3), `$1', $2)')
define(`LINK', `net add link ip_$1($2) ip_$3($4)
net node ip_$1($2) route add ip_$3($4)/32 --oif=ip_$3($4)/32 $5
net node ip_$3($4) route add ip_$1($2)/32 --oif=ip_$1($2)/32 $5
BGP(ip_$1($2), `$3', $4)
BGP(ip_$3($4), `$1', $2)')
#organizations
define(`BigCarrier', 1)
define(`Spring', 2)
define(`iCompany', 200)
define(`Abilene', 11537)
define(`GEANT', 20965)
define(`BELNET', 2611)
define(`CERN', 201)
define(`UCLA', 52)
define(`UCL', 65535)
define(`ULg', 65534)
#IP addresses
define(`ip_BigCarrier', 1.0.0.$1)
define(`ip_Spring', 2.0.0.$1)
define(`ip_iCompany', 2.1.0.$1)
define(`ip_Abilene', 3.0.0.$1)
define(`ip_GEANT', 4.0.0.$1)
define(`ip_BELNET', 4.1.0.$1)
define(`ip_BELNET2', 1.1.0.$1)
define(`ip_CERN', 4.200.0.$1)
define(`ip_CERN2', 3.200.0.$1)
define(`ip_UCLA', 3.1.0.$1)
define(`ip_UCLA2', 2.2.1.$1)
define(`ip_UCL', 130.104.0.$1)
define(`ip_ULg', 139.165.0.$1)
divert dnl
net add domain BigCarrier igp
NODE(`BigCarrier', 1, 8)
NODE(`BigCarrier', 2, 8)
NODE(`BigCarrier', 3, 8)
NODE(`BigCarrier', 4, 8)
net add domain Spring igp
NODE(`Spring', 1, 8)
NODE(`Spring', 2, 8)
NODE(`Spring', 3, 8)
NODE(`Spring', 4, 8)
net add domain iCompany igp
NODE(`iCompany', 1, 16)
net add domain Abilene igp
NODE(`Abilene', 1, 24)
NODE(`Abilene', 2, 24)
NODE(`Abilene', 3, 24)
net add domain GEANT igp
NODE(`GEANT', 1, 24)
NODE(`GEANT', 2, 24)
NODE(`GEANT', 3, 24)
NODE(`GEANT', 4, 24)
net add domain BELNET igp
NODE(`BELNET', 1, 24)
NODE(`BELNET', 2, 24)
MORE(ip_BELNET(1), ip_BELNET2(0)/24)
MORE(ip_BELNET(2), ip_BELNET2(0)/24)
net add domain CERN igp
NODE(`CERN', 1, 16)
MORE(ip_CERN(1), ip_CERN2(0)/16)
net add domain UCLA igp
NODE(`UCLA', 1, 16)
NODE(`UCLA', 2, 16)
MORE(ip_UCLA(1), ip_UCLA2(0)/24)
MORE(ip_UCLA(2), ip_UCLA2(0)/24)
net add domain UCL igp
NODE(`UCL', 1, 16)
NODE(`UCL', 2, 16)
net add domain ULg igp
NODE(`ULg', 1, 16)
NODE(`ULg', 2, 16)

ILINK(`Spring', 1, 3, 10)
ILINK(`Spring', 2, 4, 10)
ILINK(`Spring', 1, 2, 0)
ILINK(`Spring', 3, 4, 0)
net domain Spring compute
ILINK(`BigCarrier', 1, 3, 10)
ILINK(`BigCarrier', 2, 4, 10)
ILINK(`BigCarrier', 1, 2, 0)
ILINK(`BigCarrier', 3, 4, 0)
net domain BigCarrier compute
ILINK(`Abilene', 1, 2, 40)
ILINK(`Abilene', 2, 3, 50)
ILINK(`Abilene', 3, 1, 20)
net domain Abilene compute
ILINK(`GEANT', 1, 3, 5)
ILINK(`GEANT', 3, 4, 10)
ILINK(`GEANT', 4, 2, 5)
ILINK(`GEANT', 2, 1, 10)
ILINK(`GEANT', 1, 4, 12)
net domain GEANT compute
ILINK(`BELNET', 1, 2, 0)
net domain BELNET compute
ILINK(`UCL', 1, 2, 0)
net domain UCL compute
ILINK(`ULg', 1, 2, 0)
net domain ULg compute
ILINK(`UCLA', 1, 2, 0)
net domain UCLA compute

LINK(`iCompany', 1, `Spring', 1, 2)
LINK(`iCompany', 1, `Spring', 2, 2)
LINK(`iCompany', 1, `Spring', 3, 8)
LINK(`BigCarrier', 1, `Spring', 1, 65)
LINK(`BigCarrier', 2, `Spring', 2, 70)
LINK(`BigCarrier', 3, `Spring', 3, 70)
LINK(`BigCarrier', 4, `Spring', 4, 75)
LINK(`Abilene', 1, `Spring', 3, 0)
LINK(`Spring', 3, `UCLA', 1, 0)
LINK(`BigCarrier', 3, `GEANT', 1, 0)
LINK(`BigCarrier', 4, `GEANT', 1, 0)
LINK(`BigCarrier', 1, `GEANT', 2, 0)
LINK(`BELNET', 2, `BigCarrier', 2, 0)
LINK(`Abilene', 2, `UCLA', 1, 0)
LINK(`Abilene', 2, `UCLA', 2, 0)
LINK(`Abilene', 1, `GEANT', 1, 60)
LINK(`Abilene', 3, `GEANT', 3, 50)
LINK(`Abilene', 3, `CERN', 1, 55)
LINK(`CERN', 1, `GEANT', 3, 5)
LINK(`BELNET', 1, `GEANT', 3, 5)
LINK(`BELNET', 2, `GEANT', 4, 5)
LINK(`BELNET', 1, `UCL', 1, 0)
LINK(`BELNET', 1, `ULg', 1, 0)
LINK(`BELNET', 2, `UCL', 2, 0)
LINK(`BELNET', 2, `ULg', 2, 0)
