divert(-1)
#shortcuts
define(`MORE', `bgp router $1 add network $2')
define(`NODE', `net add node $1
net node $1 domain $2
bgp add router $2 $1
MORE($1, $3)')
define(`ILINK', `net add link $1 $2
net link $1 $2 igp-weight --bidir $3')
#FIXME
define(`LINK', `net add link $1 $2
net link $1 $2 igp-weight --bidir $3')
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
NODE(ip_BigCarrier(1), BigCarrier, ip_BigCarrier(0)/8)
NODE(ip_BigCarrier(2), BigCarrier, ip_BigCarrier(0)/8)
NODE(ip_BigCarrier(3), BigCarrier, ip_BigCarrier(0)/8)
NODE(ip_BigCarrier(4), BigCarrier, ip_BigCarrier(0)/8)
net add domain Spring igp
NODE(ip_Spring(1), Spring, ip_Spring(0)/8)
NODE(ip_Spring(2), Spring, ip_Spring(0)/8)
NODE(ip_Spring(3), Spring, ip_Spring(0)/8)
NODE(ip_Spring(4), Spring, ip_Spring(0)/8)
net add domain iCompany igp
NODE(ip_iCompany(1), iCompany, ip_iCompany(0)/16)
net add domain Abilene igp
NODE(ip_Abilene(1), Abilene, ip_Abilene(0)/24)
NODE(ip_Abilene(2), Abilene, ip_Abilene(0)/24)
NODE(ip_Abilene(3), Abilene, ip_Abilene(0)/24)
net add domain GEANT igp
NODE(ip_GEANT(1), GEANT, ip_GEANT(0)/24)
NODE(ip_GEANT(2), GEANT, ip_GEANT(0)/24)
NODE(ip_GEANT(3), GEANT, ip_GEANT(0)/24)
NODE(ip_GEANT(4), GEANT, ip_GEANT(0)/24)
net add domain BELNET igp
NODE(ip_BELNET(1), BELNET, ip_BELNET(0)/24)
NODE(ip_BELNET(2), BELNET, ip_BELNET(0)/24)
MORE(ip_BELNET(1), ip_BELNET2(0)/24)
MORE(ip_BELNET(2), ip_BELNET2(0)/24)
net add domain CERN igp
NODE(ip_CERN(1), CERN, ip_CERN(0)/16)
MORE(ip_CERN(1), ip_CERN2(0)/16)
net add domain UCLA igp
NODE(ip_UCLA(1), UCLA, ip_UCLA(0)/16)
NODE(ip_UCLA(2), UCLA, ip_UCLA(0)/16)
MORE(ip_UCLA(1), ip_UCLA2(0)/24)
MORE(ip_UCLA(2), ip_UCLA2(0)/24)
net add domain UCL igp
NODE(ip_UCL(1), UCL, ip_UCL(0)/16)
NODE(ip_UCL(2), UCL, ip_UCL(0)/16)
net add domain ULg igp
NODE(ip_ULg(1), ULg, ip_ULg(0)/16)
NODE(ip_ULg(2), ULg, ip_ULg(0)/16)
#TODO igp/bgp links
