---
title: "Windows 11"
date: 2023-05-08T17:31:46-05:00
weight: 50
---

We're mostly using the defaults for installing this Windows 11 machine. There are some extra steps we'll have to take since we'll be installing it without an internet connection, but otherwise any options in the installation process are purely for flavor. Eventually we'll be joining this machine to a domain; those directions are included at the end of this page, but will have to wait until after we've created the domain controller for the lab.

## OS Installation

1. Boot up the VM. When selecting the Win11 VM, VMware Workstation may request a password; enter the password created in the Creating the VMs page and we can power it on.
2. Quickly click into the VM and press a key to boot into the CD.
3. `Next`
4. `Install Now`
5. `I don't have a product key`
6. Select "Windows 11 Pro for Workstations" and click `Next`
7. Click the check box at the bottom and then click `Next`
8. `Custom: Install Windows only (advanced)`
9. `New` -> `Apply` -> `OK` -> `Next`
10. `Restart now`
11. When it finishes rebooting, press `Shift+F10`
12. `oobe\bypassnro`
13. `Yes`
14. `Yes`
15. `Skip`
16. `I don't have internet`
17. `Continue with limited setup`
18. Enter a name and click `Next`
19. Enter a password and click `Next`
20. Re-enter the password and click `Next`
21. For the security questions, we can just select the top question and enter gibberish. If the password is forgotten, we can just re-install the OS.
22. Turn off all the switches on the privacy settings page and click `Next`

## OS Configuration

For this portion, we will be disabling all the security controls on the VM. This is only for the initial attacks; we will be hardening the VM as part of later training, but the Win11 machine will be initially vulnerable.

1. Open Powershell as an administrator:
    1. Press `Win`
    2. Type `Powershell`
    3. Press `Ctrl+Shift+Enter
    4. Click `Yes`
2. `netsh advfirewall set allprofiles state off`
3. `set-mppreference -disablerealtimemonitoring $true`
4. `gpedit`
    1. Computer Configuration -> Administrative Templates -> Windows Components -> Microsoft Defender Antivirus
    2. Double-click "Turn off Microsoft Defender Antivirus"
    3. Select "Enabled" and click `Apply` and `OK`
5. `shutdown /r`

The Windows Firewall and Microsoft Defender are now disabled.

## Joining the Domain

### Under Construction