---
title: "VyOS"
date: 2023-05-08T17:30:37-05:00
weight: 40
---

The initial setup of VyOS is very simple. When booting up, the ISO just boots into a live environment. We'll install the OS from within the live environment, and use all the defaults. Once installed and rebooted, we'll confiugre the routing.

## OS Installation

1. Boot into the live environment. This will take a couple minutes
2. Log in. Username and password are `vyos`.
3. `install image`
4. Enter
5. Enter
6. Enter
7. `yes`
8. Enter
9. Enter
10. Enter
11. Enter
12. Use `vyos` for the password.
13. Enter
14. `reboot`

## Router Configuration

To make this easier, we can edit the network configuration of VMnet2 to connect the host to the network, and then enter the following to SSH into the VM:

1. Log in as `vyos`
2. `configure`
3. `set service ssh`
4. `set interface ethernet eth0 address 10.0.0.250/24`
5. `commit`
6. `save`

We can now open a terminal window and ssh in to do the rest of the configuration (`ssh vyos@10.0.0.250`).

1. Log in as `vyos`
2. `configure`
3. Enter the following:
*firewall rules*
```
set firewall group network-group OUTERWORLD network 10.0.0.0/24
set firewall name OUTERWORLD default-action accept
set firewall name OUTERWORLD enable-default-log
set firewall name OUTERWORLD rule 100 action accept
set firewall name OUTERWORLD rule 100 destination group network-group OUTERWORLD
set firewall name OUTERWORLD rule 100 source group network-group OUTERWORLD
set firewall name OUTERWORLD rule 100 protocol all
set firewall name OUTERWORLD rule 100 state new enable

set firewall group network-group USERLAND network 10.0.1.0/24
set firewall name USERLAND default-action accept
set firewall name USERLAND enable-default-log
set firewall name USERLAND rule 100 action accept
set firewall name USERLAND rule 100 destination group network-group USERLAND
set firewall name USERLAND rule 100 source group network-group USERLAND
set firewall name USERLAND rule 100 protocol all
set firewall name USERLAND rule 100 state new enable

set firewall group network-group ABYSS network 10.0.2.0/24
set firewall name ABYSS default-action accept
set firewall name ABYSS enable-default-log
set firewall name ABYSS rule 100 action accept
set firewall name ABYSS rule 100 destination group network-group ABYSS
set firewall name ABYSS rule 100 source group network-group ABYSS
set firewall name ABYSS rule 100 protocol all
set firewall name ABYSS rule 100 state new enable

set firewall group network-group AXIS network 10.0.3.0/24
set firewall name AXIS default-action accept
set firewall name AXIS enable-default-log
set firewall name AXIS rule 100 action accept
set firewall name AXIS rule 100 destination group network-group AXIS
set firewall name AXIS rule 100 source group network-group AXIS
set firewall name AXIS rule 100 protocol all
set firewall name AXIS rule 100 state new enable

set firewall group network-group OVERWATCH network 10.0.4.0/24
set firewall name OVERWATCH default-action accept
set firewall name OVERWATCH enable-default-log
set firewall name OVERWATCH rule 100 action accept
set firewall name OVERWATCH rule 100 destination group network-group OVERWATCH
set firewall name OVERWATCH rule 100 source group network-group OVERWATCH
set firewall name OVERWATCH rule 100 protocol all
set firewall name OVERWATCH rule 100 state new enable
```

*interface setup*
```
set interface ethernet eth0 address 10.0.0.250/24
set interface ethernet eth0 mirror egress eth5
set interface ethernet eth0 mirror ingress eth5

set interface ethernet eth1 address 10.0.1.1/24
set interface ethernet eth1 mirror egress eth5
set interface ethernet eth1 mirror ingress eth5
set service dhcp-server shared-network-name USERLAND subnet 10.0.1.0/24 default-router 10.0.1.1
set service dhcp-server shared-network-name USERLAND subnet 10.0.1.0/24 domain-name cybermice.dev
set service dhcp-server shared-network-name USERLAND subnet 10.0.1.0/24 lease 86400
set service dhcp-server shared-network-name USERLAND subnet 10.0.1.0/24 range 0 start 10.0.1.8
set service dhcp-server shared-network-name USERLAND subnet 10.0.1.0/24 range 0 stop 10.0.1.247

set interface ethernet eth2 address 10.0.2.1/24
set interface ethernet eth2 mirror egress eth5
set interface ethernet eth2 mirror ingress eth5
set service dhcp-server shared-network-name ABYSS subnet 10.0.2.0/24 default-router 10.0.2.1
set service dhcp-server shared-network-name ABYSS subnet 10.0.2.0/24 domain-name cybermice.dev
set service dhcp-server shared-network-name ABYSS subnet 10.0.2.0/24 lease 86400
set service dhcp-server shared-network-name ABYSS subnet 10.0.2.0/24 range 0 start 10.0.2.8
set service dhcp-server shared-network-name ABYSS subnet 10.0.2.0/24 range 0 stop 10.0.2.247

set interface ethernet eth3 address 10.0.3.1/24
set interface ethernet eth3 mirror egress eth5
set interface ethernet eth3 mirror ingress eth5
set service dhcp-server shared-network-name AXIS subnet 10.0.3.0/24 default-router 10.0.3.1
set service dhcp-server shared-network-name AXIS subnet 10.0.3.0/24 domain-name cybermice.dev
set service dhcp-server shared-network-name AXIS subnet 10.0.3.0/24 lease 86400
set service dhcp-server shared-network-name AXIS subnet 10.0.3.0/24 range 0 start 10.0.3.8
set service dhcp-server shared-network-name AXIS subnet 10.0.3.0/24 range 0 stop 10.0.3.247

set interface ethernet eth4 address 10.0.4.1/24
set interface ethernet eth4 mirror egress eth5
set interface ethernet eth4 mirror ingress eth5
set service dhcp-server shared-network-name OVERWATCH subnet 10.0.4.0/24 default-router 10.0.4.1
set service dhcp-server shared-network-name OVERWATCH subnet 10.0.4.0/24 domain-name cybermice.dev
set service dhcp-server shared-network-name OVERWATCH subnet 10.0.4.0/24 lease 86400
set service dhcp-server shared-network-name OVERWATCH subnet 10.0.4.0/24 range 0 start 10.0.4.8
set service dhcp-server shared-network-name OVERWATCH subnet 10.0.4.0/24 range 0 stop 10.0.4.247
set service dhcp-server shared-network-name OVERWATCH subnet 10.0.4.0/24 static-mapping SECURITYONION ip-address 10.0.4.5
set service dhcp-server shared-network-name OVERWATCH subnet 10.0.4.0/24 static-mapping SECURITYONION mac-address xx:xx:xx:xx:xx:xx
```
The mac address can be acquired by entering the settings of the security onion vm, selecting Network Adapter, clicking Advanced..., and clicking Generate.

This configuration will get dhcp working for all the devices, *including* for the management port of the security onion (which we've set a reservation for), and also set each port as the default gateway for its network.