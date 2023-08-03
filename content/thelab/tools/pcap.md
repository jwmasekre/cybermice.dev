---
title: "PCAP"
date: 2023-07-29T22:28:01-05:00
weight: 50
---

This page has all the packet captures Cartographer has carved out for analysts. Packet captures are stored on whatever devices are sensor nodes (in our example, the standalone is the sensor, since it contains all the components), filling up as much space as it can before rolling over and being overwritten. Analysts can query against the captures on the sensors to pull specific data, making PCAP analysis much more expedient.

The plus button at the top of the page can be used to carve out PCAPS. This menu will retain whatever previous settings were used. The name of the sensor must be included in order to pull PCAP data (for our setup, this is just `securityonion` unless you chose a different name for the standalone). PCAPs can be imported on the sensor, which will output a UUID for reference, and you can use this to carve out a PCAP from another source. You can also define the source IP/port, destination IP/port, and the start and end times. Once the job has completed, this pcap is available to every analyst with the appropriate permissions to both view (the binoculars icon) and download (inside the view menu), as well as ship to the internal CyberChef instance for data manipulation and analysis (also in the view menu).
