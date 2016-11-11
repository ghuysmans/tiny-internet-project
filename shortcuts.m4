divert(-1)
define(`MORE', `#MORE($1, $2)
bgp router $1 add network $2')
define(`NODE', `#NODE($1, $2, $3)
net add node ip_$1($2)
net node ip_$1($2) domain $1
bgp add router $1 ip_$1($2)
MORE(ip_$1($2), ip_$1(0)/$3)')
define(`BGP', `#BGP($1, $2, $3)
bgp router $1
	add peer $2 ip_$2($3)
	peer ip_$2($3) next-hop-self
	peer ip_$2($3) up
	exit')
define(`LINK', `#LINK($1, $2, $3, $4, $5)
net add link ip_$1($2) ip_$3($4)
net node ip_$1($2) route add ip_$3($4)/32 --oif=ip_$3($4)/32 $5
net node ip_$3($4) route add ip_$1($2)/32 --oif=ip_$1($2)/32 $5
BGP(ip_$1($2), `$3', $4)
BGP(ip_$3($4), `$1', $2)')
#BEWARE, the cost can't be zero!
define(`ILINK', `#ILINK($1, $2, $3, $4)
LINK(`$1', `$2', `$1', `$3', `$4')
net link ip_$1($2) ip_$1($3) igp-weight --bidir $4')

define(`ROUTES', `print "`$1'($2) is ip_$1($2)\n"
net node ip_$1($2) show rt *')
define(`PEERS', `print "`$1'($2) is connected to:\n"
bgp router ip_$1($2) show peers')
define(`PING', `print "`$1'($2) pings `$3'($4): "
net node ip_$1($2) ping ip_$3($4)')
define(`TRACE', `print "`$1'($2) to `$3'($4):\n"
net node ip_$1($2) traceroute ip_$3($4)')
