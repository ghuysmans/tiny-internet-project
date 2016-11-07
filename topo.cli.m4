divert(-1)
#shortcuts
define(`MORE', `bgp router $1 add network $2')
define(`NODE', `net add node ip_$1($2)
net node ip_$1($2) domain $1
bgp add router $1 ip_$1($2)
MORE(ip_$1($2), ip_$1(0)/$3)')
define(`ILINK', `net add link $1 $2
net link $1 $2 igp-weight --bidir $3')
define(`LINK', `net add link $1 $3
net node $1 route add $3/32 --oif=$3/32 $5
net node $3 route add $1/32 --oif=$1/32 $5
bgp router $1 add peer $4 $3
bgp router $3 add peer $2 $1
bgp router $1 peer $3 up
bgp router $3 peer $1 up')
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

ILINK(ip_Spring(1), ip_Spring(3), 10)
ILINK(ip_Spring(2), ip_Spring(4), 10)
ILINK(ip_Spring(1), ip_Spring(2), 0)
ILINK(ip_Spring(3), ip_Spring(4), 0)
net domain Spring compute
ILINK(ip_BigCarrier(1), ip_BigCarrier(3), 10)
ILINK(ip_BigCarrier(2), ip_BigCarrier(4), 10)
ILINK(ip_BigCarrier(1), ip_BigCarrier(2), 0)
ILINK(ip_BigCarrier(3), ip_BigCarrier(4), 0)
net domain BigCarrier compute
ILINK(ip_Abilene(1), ip_Abilene(2), 40)
ILINK(ip_Abilene(2), ip_Abilene(3), 50)
ILINK(ip_Abilene(3), ip_Abilene(1), 20)
net domain Abilene compute
ILINK(ip_GEANT(1), ip_GEANT(3), 5)
ILINK(ip_GEANT(3), ip_GEANT(4), 10)
ILINK(ip_GEANT(4), ip_GEANT(2), 5)
ILINK(ip_GEANT(2), ip_GEANT(1), 10)
ILINK(ip_GEANT(1), ip_GEANT(4), 12)
net domain GEANT compute
ILINK(ip_BELNET(1), ip_BELNET(2), 0)
net domain BELNET compute
ILINK(ip_UCL(1), ip_UCL(2), 0)
net domain UCL compute
ILINK(ip_ULg(1), ip_ULg(2), 0)
net domain ULg compute
ILINK(ip_UCLA(1), ip_UCLA(2), 0)
net domain UCLA compute

LINK(ip_iCompany(1), iCompany, ip_Spring(1), Spring, 2)
LINK(ip_iCompany(1), iCompany, ip_Spring(2), Spring, 2)
LINK(ip_iCompany(1), iCompany, ip_Spring(3), Spring, 8)
LINK(ip_BigCarrier(1), BigCarrier, ip_Spring(1), Spring, 65)
LINK(ip_BigCarrier(2), BigCarrier, ip_Spring(2), Spring, 70)
LINK(ip_BigCarrier(3), BigCarrier, ip_Spring(3), Spring, 70)
LINK(ip_BigCarrier(4), BigCarrier, ip_Spring(4), Spring, 75)
LINK(ip_Abilene(1), Abilene, ip_Spring(3), Spring, 0)
LINK(ip_Spring(3), Spring, ip_UCLA(1), UCLA, 0)
LINK(ip_BigCarrier(3), BigCarrier, ip_GEANT(1), GEANT, 0)
LINK(ip_BigCarrier(4), BigCarrier, ip_GEANT(1), GEANT, 0)
LINK(ip_BigCarrier(1), BigCarrier, ip_GEANT(2), GEANT, 0)
LINK(ip_BELNET(2), BELNET, ip_BigCarrier(2), BigCarrier, 0)
LINK(ip_Abilene(2), Abilene, ip_UCLA(1), UCLA, 0)
LINK(ip_Abilene(2), Abilene, ip_UCLA(2), UCLA, 0)
LINK(ip_Abilene(1), Abilene, ip_GEANT(1), GEANT, 60)
LINK(ip_Abilene(3), Abilene, ip_GEANT(3), GEANT, 50)
LINK(ip_Abilene(3), Abilene, ip_CERN(1), CERN, 55)
LINK(ip_CERN(1), CERN, ip_GEANT(3), GEANT, 5)
LINK(ip_BELNET(1), BELNET, ip_GEANT(3), GEANT, 5)
LINK(ip_BELNET(2), BELNET, ip_GEANT(4), GEANT, 5)
LINK(ip_BELNET(1), BELNET, ip_UCL(1), UCL, 0)
LINK(ip_BELNET(1), BELNET, ip_ULg(1), ULg, 0)
LINK(ip_BELNET(2), BELNET, ip_UCL(2), UCL, 0)
LINK(ip_BELNET(2), BELNET, ip_ULg(2), ULg, 0)
