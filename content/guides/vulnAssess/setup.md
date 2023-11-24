---
title: "Setup"
date: 2023-11-22
weight: 10
---

This is a short walkthrough for preparing for the Vulnerability Assessment & Reporting class by Sky in January. You're not expected to spend time outside of drill, but if you wish to do so, you're more than welcome. I will give time in January for the setup. 

### Kali

You should have already setup Kali from the [Kali block](../../../thelab/setup/creating_the_vms/#kali). There is one small change, however, and that's changing the network adapter:
1. Open VMWare
2. Click on your Kali VM
3. Edit virtual machine settings
4. Network Adapter: NAT -> `OK`
5. Login to Kali
6. Type `ip addr` to check your IP Address. (It shouldn't match the lab...)
7. Open a terminal
8. Type `nikto -Version` to ensure your installed nikto tool is current (2.5.0 at the time of this writing)
9. If it's not up to date, github it. 

**NOTE** Don't forget to change this setting back if you're using Kali for [The Lab](../../../thelab/).

### Kioptrix

1. Download [Kioptrix Level 1](https://download.vulnhub.com/kioptrix/Kioptrix_Level_1.rar) on your host machine
2. Unzip the contents somewhere of your choosing
3. Navigate to the file until you see all of the contents
4. Open up 'Kioptrix Level 1' with the type of 'VMware virtual machine configuration' in a text editor
5. Locate the text 'bridged' and replace it with 'NAT'
- I had two locations: ethernet0.networkName on line 35, ethernet0.connectionType on line 73
6. Open up VMWare Pro
7. Select Open a Virtual Machine
8. Navigate to the Kioptrix folder and select the machine
9. Ensure the Network Adapter is set to NAT, rest of the defaults are fine
10. Boot up Kioptrix
11. Username: `john` password: `TwoCows2`
12. Type `ping -c 1 8.8.8.8` and to check you have a working IP address

    ![Kioptrix IP address](../images/kioIP.png)

### Nessus

1. Visit [Nessus](https://www.tenable.com/downloads/nessus?loginAttempted=true) website
2. Select your version and platform (Linux - Ubuntu - amd64)
3. Click Download
4. Click I Agree
5. Open a terminal and navigate to the downloaded file
6. Type `sudo dpkg -i Nessus` and tab to autocomplete the file
7. Refer to the output for the next command

    ![Instructions to start and run Nessus](../images/nessusIns.png)
    
8. Type `/bin/systemctl start nessusd.service`
9. Go to your browser and type in `https://kali:8834` or whatever the previous output statement referred
10. If a screen advises the site may be unsecure, go to it anyways
11. Click Continue
12. Register for Nessus Essentials
13. Type in your information - Doesn't need to be your real name
14. Copy the Activation Code and save it somewhere
15. Wait for everything to download and configure (may take a while)
