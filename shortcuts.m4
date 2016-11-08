divert(-1)
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
