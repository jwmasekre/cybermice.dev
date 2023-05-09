---
title: "Creating the VMs"
date: 2023-05-08T17:30:22-05:00
weight: 30
---

## VyOS

VyOS is the router for this lab, but will also function like a switch. As a result, the VM will require 6 NICs. Additionally, it will be mirroring all network traffic to the Security Onion monitoring port, so it will need more memory than normal to ensure packets aren't dropped.

1. File -> New Virtual Machine...
2. Custom (advanced) -> `Next >`
3. Hardware compatibility: Workstation 15.x -> `Next >`
4. Installer disc image file (iso): vyos-rolling-latest.iso -> `Next >`
5. Linux, Version "Other Linux 5.x or later kernel 64-bit" -> `Next >`
6. Virtual machine name: VyOS -> `Next >`
7. Number of processors: 1, Number of cores per processor: 1 -> `Next >`
8. Memory for this virtual machine: 4096 -> `Next >`
9. Use host-only networking -> `Next >`
10. LSI Logic (Recommended) -> `Next >`
11. SCSI (Recommended) -> `Next >`
12. Create a new virtual disk -> `Next >`
13. Maximum disk size (GB): 10, Split virtual disk into multiple files -> `Next >`
14. `Next >`
15. `Customize Hardware`
16. Network Adapter: Custom: Specific virtual network: VMnet2
17. Add..., Network Adapter
18. Network Adapter 2: Custom: Specific virtual network: VMnet3
19. Add..., Network Adapter
20. Network Adapter 3: Custom: Specific virtual network: VMnet4
21. Add..., Network Adapter
22. Network Adapter 4: Custom: Specific virtual network: VMnet5
23. Add..., Network Adapter
24. Network Adapter 5: Custom: Specific virtual network: VMnet6
25. Add..., Network Adapter
26. Network Adapter 6: Custom: Specific virtual network: VMnet6
27. `Close`
28. `Finish`

## Win11

Windows 11 is what we'll use as our end user (read: victim) machine. Windows 11 requires a TPM unless extra steps are taken, and since we want the environment to be reasonably realistic we'll set up a virtual TPM.

1. File -> New Virtual Machine...
2. Custom (advanced) -> `Next >`
3. Hardware compatibility: Workstation 15.x -> `Next >`
4. Installer disc image file (iso): Win11_22H2_English_x64v1.iso -> `Next >`
5. Microsoft Windows, Version "Windows 10 x64" -> `Next >`
6. Virtual machine name: Win11 -> `Next >`
7. UEFI, Secure Boot -> `Next >`
8. Number of processors: 1, Number of cores per processor: 2 -> `Next >`
9. Memory for this virtual machine: 4096 -> `Next >`
10. Use host-only networking -> `Next >`
11. LSI Logic SAS (Recommended) -> `Next >`
12. NVME (Recommended) -> `Next >`
13. Create a new virtual disk -> `Next >`
14. Maximum disk size (GB): 100, Split virtual disk into multiple files -> `Next >`
15. `Next >`
16. `Customize Hardware`
17. Network Adapter: Custom: Specific virtual network: VMnet3
18. `Close`
19. `Finish`
20. Right-click Win11 -> Settings...
21. Options tab -> Access Control, `Encrypt...`
22. Enter a password ("password" is perfectly acceptible for this) -> `Encrypt`
23. Hardware tab -> Add...
24. Trusted Platform Module
25. OK

## WS19

Windows Server 2019 will be our DC and DNS server. It requires no special hardware except we cannot load the ISO until after we've created the VM, because VMWare Workstation will try to set it up for us, but we don't have a key to provide and it breaks setup.

1. File -> New Virtual Machine...
2. Custom (advanced) -> `Next >`
3. Hardware compatibility: Workstation 15.x -> `Next >`
4. I will install the operating system later. -> `Next >`
5. Microsoft Windows, Version "Windows Server 2016" -> `Next >`
6. Virtual machine name: WS19 -> `Next >`
7. UEFI, Secure Boot -> `Next >`
8. Number of processors: 2, Number of cores per processor: 1 -> `Next >`
9. Memory for this virtual machine: 8192 -> `Next >`
10. Use host-only networking -> `Next >`
11. LSI Logic SAS (Recommended) -> `Next >`
12. NVME (Recommended) -> `Next >`
13. Create a new virtual disk -> `Next >`
14. Maximum disk size (GB): 80, Split virtual disk into multiple files -> `Next >`
15. `Next >`
16. `Customize Hardware`
17. Network Adapter: Custom: Specific virtual network: VMnet5
18. New CD/DVD (SATA): Use ISO image file: ws19.iso
19. `Close`
20. `Finish`

## Kali

For our attacker machine, we'll be using a pre-generated version of Kali. All that needs to be done is to extract the .7z file, double -click the .vmx file, and load it with VMWare Workstation. Once it's created, the settings can be modified but it's really not necessary for what we need it for. The only setting that must be changed is to change the network adapter to connect to VMnet4

## Security Onion

The star of the show, Security Onion is the IDS for the network and the center of our training. It needs a decent amount of RAM for processing logs and disk space for storing them, as well as an extra NIC for receiving packets.

1. File -> New Virtual Machine...
2. Custom (advanced) -> `Next >`
3. Hardware compatibility: Workstation 15.x -> `Next >`
4. Installer disc image file (iso): securityonion-2.3.240-20230436.iso -> `Next >`
5. Linux, Version "CentOS 7 64-bit" -> `Next >`
6. Virtual machine name: SO-Standalone -> `Next >`
7. Number of processors: 2, Number of cores per processor: 2 -> `Next >`
8. Memory for this virtual machine: 16384 -> `Next >`
9. Use host-only networking -> `Next >`
10. LSI Logic (Recommended) -> `Next >`
11. SCSI (Recommended) -> `Next >`
12. Create a new virtual disk -> `Next >`
13. Maximum disk size (GB): 200, Split virtual disk into multiple files -> `Next >`
14. `Next >`
15. `Customize Hardware`
16. Network Adapter: Custom: Specific virtual network: VMnet6
17. Add..., Network Adapter
18. Network Adapter 2: Custom: Specific virtual network: VMnet6
19. `Close`
20. `Finish`
