Content-Type: multipart/mixed; boundary="===============0086047718136476635=="
MIME-Version: 1.0

--===============0086047718136476635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="config"


config system global
set hostname ${fgt_id}
end
config system admin
edit "admin"
set password ${fgt_admin_password}
set force-password-change disable
set gui-default-dashboard-template "minimal"
set gui-ignore-release-overview-version "7.0.0"
next
end
config system interface
edit port1
set alias public
set mode static
set ip ${Port1IP} ${public_subnet_mask}
set allowaccess ping https ssh fgfm
set mtu-override enable
set mtu 9001
next
edit port2
set alias private
set mode static
set ip ${Port2IP} ${private_subnet_mask}
set allowaccess ping fgfm
set mtu-override enable
set mtu 9001
next
end

config system vdom-exception
edit 1
set object system.interface
next
edit 2
set object router.static
next
end

config system geneve
edit "gwlb1-az1"
set interface "port1"
set type ppp
set remote-ip ${gwlb_ip1}
next
edit "gwlb1-az2"
set interface "port1"
set type ppp
set remote-ip ${gwlb_ip2}
next
end

config system zone
edit "gwlb1-tunnels"
set interface "gwlb1-az1" "gwlb1-az2"
next
end

config router static
edit 1
set device port1
set gateway ${PublicSubnetRouterIP}
next
edit 2
set device port2
set dst ${security_cidr}
set gateway ${PrivateSubnetRouterIP}
next
edit 3
set device port2
set dst ${spoke1_cidr}
set gateway ${PrivateSubnetRouterIP}
next
edit 4
set device port2
set dst ${spoke2_cidr}
set gateway ${PrivateSubnetRouterIP}
next
edit 5
set distance 5
set priority 100
set device "gwlb1-az1"
next
edit 6
set distance 5
set priority 100
set device "gwlb1-az2"
next
end
config router policy
edit 1
set input-device "gwlb1-az1"
set dst "10.0.0.0/255.0.0.0" "17.16.0.0/255.255.240.0" "192.168.0.0/255.255.0.0"
set output-device "gwlb1-az1"
next
edit 2
set input-device "gwlb1-az1"
set src "10.0.0.0/255.0.0.0" "17.16.0.0/255.255.240.0" "192.168.0.0/255.255.0.0"
set output-device "gwlb1-az1"
next
edit 3
set input-device "gwlb1-az2"
set dst "10.0.0.0/255.0.0.0" "172.16.0.0/255.255.240.0" "192.168.0.0/255.255.0.0"
set output-device "gwlb1-az2"
next
edit 4
set input-device "gwlb1-az2"
set src "10.0.0.0/255.0.0.0" "172.16.0.0/255.255.240.0" "192.168.0.0/255.255.0.0"
set output-device "gwlb1-az2"
next
end

config firewall address
edit toSpoke1
set subnet ${spoke1_cidr}
next
edit toSpoke2
set subnet ${spoke2_cidr}
next
edit "10.0.0.0/8"
set subnet 10.0.0.0 255.0.0.0
next
edit "172.16.0.0/20"
set subnet 172.16.0.0 255.255.240.0
next
edit "192.168.0.0/16"
set subnet 192.168.0.0 255.255.0.0
next
edit "UnitedStates"
set type geography
set country "US"
next
edit "UnitedStatesIslands"
set type geography
set country "UM"
next
edit "Canada"
set type geography
set country "CA"
next
end

config firewall addrgrp
edit "rfc-1918-subnets"
set member "10.0.0.0/8" "172.16.0.0/20" "192.168.0.0/16"
next
edit "NorthAmerica"
set member "Canada" "UnitedStates" "UnitedStatesIslands"
next
edit to-WEST
set member toSpoke1 toSpoke2 toMgmt
next
end

config firewall vip
edit "vip_to_east"
set extintf "port1"
set portforward enable
set mappedip "192.168.0.11"
set extport 2222
set mappedport 22
next
edit "vip_to_east_http"
set extintf "port1"
set portforward enable
set mappedip "192.168.0.11"
set extport 8080
set mappedport 80
next
edit "vip_to_west_http"
set extintf "port1"
set portforward enable
set mappedip "192.168.1.11"
set extport 8081
set mappedport 80
next
edit "vip_to_west"
set extintf "port1"
set portforward enable
set mappedip "192.168.1.11"
set extport 2223
set mappedport 22
next
edit "vip_to_fortimanager_https"
set extintf "port1"
set portforward enable
set mappedip "10.0.6.50"
set extport 9443
set mappedport 443
next
edit "vip_to_fortimanager_ssh"
set extintf "port1"
set portforward enable
set mappedip "10.0.6.50"
set extport 2224
set mappedport 22
next
end

config firewall policy
edit 1
set name East-West
set srcintf port2
set dstintf port2
set srcaddr all
set dstaddr to-WEST
set action accept
set schedule always
set service ALL
set logtraffic all
next
edit 2
set name South-North
set srcintf port2
set dstintf port1
set srcaddr all
set dstaddr to-WEST
set dstaddr-negate enable
set action accept
set schedule always
set service ALL
set logtraffic all
set nat enable
next
edit 3
set name "vip_to_east"
set srcintf "port1"
set dstintf "port2"
set srcaddr "all"
set dstaddr "vip_to_east"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
edit 4
set name "vip_to_west"
set srcintf "port1"
set dstintf "port2"
set srcaddr "all"
set dstaddr "vip_to_west"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
edit 5
set name "vip_to_east_80"
set srcintf "port1"
set dstintf "port2"
set srcaddr "all"
set dstaddr "vip_to_east_http"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
edit 6
set name "vip_to_west_80"
set srcintf "port1"
set dstintf "port2"
set srcaddr "all"
set dstaddr "vip_to_west_http"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
edit 7
set name "vip_to_fortimanager_443"
set srcintf "port1"
set dstintf "port2"
set srcaddr "all"
set dstaddr "vip_to_fortimanager_https"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
edit 8
set name "vip_to_fortimanager_22"
set srcintf "port1"
set dstintf "port2"
set srcaddr "all"
set dstaddr "vip_to_fortimanager_ssh"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
edit 9
set name "egress"
set srcintf "gwlb1-tunnels"
set dstintf "port1"
set srcaddr "rfc-1918-subnets"
set dstaddr "NorthAmerica"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
set nat enable
next
edit 10
set name "ingress"
set srcintf "gwlb1-tunnels"
set dstintf "gwlb1-tunnels"
set srcaddr "NorthAmerica"
set dstaddr "rfc-1918-subnets"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
edit 11
set name "egress-hairpin"
set srcintf "gwlb1-tunnels"
set dstintf "gwlb1-tunnels"
set srcaddr "rfc-1918-subnets"
set dstaddr "NorthAmerica"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
edit 12
set name "east-west"
set srcintf "gwlb1-tunnels"
set dstintf "gwlb1-tunnels"
set srcaddr "rfc-1918-subnets"
set dstaddr "rfc-1918-subnets"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
end

--===============0086047718136476635==--