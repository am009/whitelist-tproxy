#!/usr/sbin/nft -f

table inet v2ray {
	set china_v6 {
		type ipv6_addr
		flags constant, interval
	}
	set proxy_v6 {
		type ipv6_addr
		flags interval, timeout
		timeout 1h
		counter
	}
	set proxy_v4 {
		type ipv4_addr
		flags timeout
		timeout 1h
		counter
	}
}
flush table inet v2ray
# 删了set之后，反而mosdns报错，导致DNS失效。
# delete set inet v2ray china_v6
# delete set inet v2ray proxy_v6
# delete set inet v2ray proxy_v4
# delete table inet v2ray
