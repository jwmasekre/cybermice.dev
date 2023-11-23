---
title: "Setup"
date: 2023-11-22
weight: 10
---
Under Construction - Testing phase

# One Hash

## Two Hash

### Three Hash

#### Four Hash

* **Bold bullet point**: Stuff
* *Italic bullet point*: Stuff

`code to copy and paste`

---

This is a short walkthrough for preparing for the Vulnerability Assessment & Reporting class by Sky in January. You're not expected to spend time outside of drill, but if you wish to do so, you're more than welcome. I will give time in January for the setup. 

### Kali

You should have already setup Kali from the [Kali block](../../thelab/creating_the_vms/#kali). There is one small change, however, and that's changing the network adapter:
1. Open VMWare
2. Click on your Kali VM
3. Edit virtual machine settings
4. Network Adapter: NAT -> `OK`
5. Login to Kali
6. Type `ip addr` to check your IP Address. (It shouldn't match the lab...)
7. Open a terminal
8. Type `nikto -Version` to ensure your installed nikto tool is current (2.5.0 at the time of this writing)
9. If it's not up to date, github it. 

**NOTE** Don't forget to change this setting back if you're using Kali for [The Lab](../../thelab/_index.md).

### Kioptrix

### Nessus
