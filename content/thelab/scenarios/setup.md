---
title: "Scenario Setup"
date: 2023-07-29T22:28:01-05:00
weight: 1
---

This page includes steps that must be taken for each scenario. They are consolidated on this page so that all required commands and configurations can be completed en masse, instead of having to do setup every time a scenario needs to be done. This page will grow as more scenarios are added.

## Scenario 1

For this scenario we just need to activate all the available playbooks and run the sample data.

### Activate Playbooks

1. Navigate to Playbook
2. Scroll down and select `150` to maximize the number of plays per page.
3. Scroll back to the top, and select the topmost checkbox to select all plays on the page.
4. Click the three dots next to one of the highlighted plays.
5. Status -> Active
6. The page will reload once all plays on the page have been activated. Repeat steps 3-5 until all plays have been activated.

### Run sample data

1. In your host terminal, `wget https://www.malware-traffic-analysis.net/2020/09/16/2020-09-16-Qakbot-infection-traffic.pcap.zip -outfile .\scenario1.pcap.zip`
2. Unzip the file. The password is `infected` (this is an industry standard)
3. `scp .\2020-09-16-Qakbot-infection-traffic.pcap admin@10.0.4.5:/home/admin/scenario1.pcap`
4. Ssh into the Security Onion.
5. `sudo so-import-pcap ./scenario1.pcap`
6. Copy the link provided in the terminal and paste it in your browser to verify it imported. (depending on your terminal, you may be able to ctrl+click the link)
7. Navigate to the [Alerts](../tools/alerts) page and change your time range to cover 2020/09/16. There should be alerts. Begin [Scenario 1](./scenario1.md)
