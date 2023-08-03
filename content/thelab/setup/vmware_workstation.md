---
title: "Vmware Workstation"
date: 2023-05-08T17:31:33-05:00
weight: 20
---

First, we need to configure VMWare Workstation. These instructions are written for Workstation 15.5 Pro. Paths and names are subject to change in future versions. The only component that must be addressed is creating the individual networks.

1. Edit -> Virtual Network Editor
2. Change Settings (bottom right)
3. Add Network...
    1. Host-Only
    2. Uncheck Connect a host virtual adapter to this network
    3. Uncheck Use local DHCP service to distribute IP address to VMs
    4. Subnet IP: 10.0.0.0
    5. Subnet mask: 255.255.255.0
4. Repeat 4 times, using the following IPs and Subnet masks:
    1. 10.0.1.0 255.255.255.0
    2. 10.0.2.0 255.255.255.0
    3. 10.0.3.0 255.255.255.0
    4. 10.0.4.0 255.255.255.0
5. Apply/OK

The Virtual Network Editor will likely look like the following:
|Name|Type|External Connection|Host Connection|DHCP|Subnet Address|
|---|---|---|---|---|---|
|VMnet0|Bridged|Auto-bridging|-|-|-|
|VMnet1|Host-only|-|Connected|Enabled|192.168.75.0|
|VMnet2|Custom|-|-|-|10.0.0.0|
|VMnet3|Custom|-|-|-|10.0.1.0|
|VMnet4|Custom|-|-|-|10.0.2.0|
|VMnet5|Custom|-|-|-|10.0.3.0|
|VMnet6|Custom|-|-|-|10.0.4.0|
|VMnet8|NAT|NAT|Connected|Enabled|192.168.56.0|

The important networks for this lab are VMnet2-6. With these configured the VMs can be created.
