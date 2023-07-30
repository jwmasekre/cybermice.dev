---
title: "Design"
date: 2023-05-08T17:27:12-05:00
weight: 10
---

The design of the lab is intended to simulate a slice of a commercial network. VMWare Workstation Pro gives us the L1 virtualization. We use a VyOS VM for switching and routing and create a separate subnet for each type of device: User (Windows 11), Attacker (Kali), Server (Windows Server 2019), and IDS (Security Onion).

## Network Map

{{< mermaid >}}
flowchart TD
    A([fa:fa-cloud Internet/Host]) --- |10.0.0.0/24| B{fa:fa-arrows VyOS}
    B ---|10.0.1.0/24| C[fa:fa-laptop Win11]
    B ---|10.0.2.0/24| D[fa:fa-laptop Kali]
    B ---|10.0.3.0/24| E[fa:fa-server WS19]
    B ---|10.0.4.0/24| F[fa:fa-eye Security Onion]
    B ---|Monitoring| F
{{< /mermaid >}}

## VM Settings

|VM|HDD|MEM|NIC|CPU|Other|
|---|---|---|---|---|---|
|VyOS|50GB|4GB|6|1p/1c||
|Win11|100GB|4GB|1|1p/1c|TPM|
|Kali|80GB|8GB|1|2p/2c||
|WS19|80GB|8GB|1|2p/1c||
|SecOnion|200GB|16GB|2|2p/2c|