---
title: "Administration"
date: 2023-07-29T22:28:01-05:00
weight: 80
---

Administration is a dropdown of 4 different pages: [Users](#users), [Grid Members](#grid-members), [Configuration]($configuration), and [License Key](#license-key).

## Users

The Users menu is for managing all users that can access the Security Onion in some way. The 5 types of roles for users are Analyst, Auditor, Limited Analyst, Limited Auditor, and Superuser. Superusers have full access to everything. Analysts also have full access, and for our purposes are equivalent to Superusers. Limited Analysts do not have access to other users' PCAP jobs or to view other users. Auditors cannot perform actions (acknowledging/escalating alerts or creating/deleting PCAP jobs), but can otherwise view everything. Limited Auditors additionally cannot view other users' PCAP jobs or other user accounts.

When creating users, the Security Onion will track whether or not they have changed the password, so you can create a default password for them and verify they change their password when the log in for the first time.

## Grid Members

Largely useless for our usecase, this is where nodes in a distributed setup would be onboarded into the grid. This process is started in the installation of the Security Onion on non-manager nodes, and requires firewall entries in [Configuration](#configuration).

## Configuration

Security Onion 2.4 has migrated all of their scripted configuration functionality to this page. Pretty much every way you can configure the nodes is available here now, instead of either being a CLI tool/script or manually editing a YAML file and reloading the service. This also ensures proper distribution of relevant configurations via Salt. The most relevant configuration option is located under `firewall -> hostgroups`; this is the replacement for `so-allow`, the old (2.3 and older) CLI tool for adding firewall entries for all the different roles.

## License Key

This is likely in the case that you have a paid license with Elastic or Security Onion; this is irrelevant to our use here.
