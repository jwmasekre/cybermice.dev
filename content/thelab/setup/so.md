---
title: "Security Onion"
date: 2023-05-08T17:33:01-05:00
weight: 80
---

We will be building out our Security Onion as a standalone 2.4 install. Since it's 2.4, it's based on Rocky Linux 9 rather than CentOS 7 (this will eventually migrate to Oracle Linux). This install will be an airgap install since we don't have the security onion connected to the internet. 

## OS Installation

1. Select `Install Security Onion 2.4` or just let it automatically start
2. `yes`
3. Enter a username. `admin` works just fine.
4. Enter a password. `password` works just fine. Confirm it.
5. When the OS finishes installing, press enter.


## Software Install

Quick note: Navigating the UI for the setup is a little weird. Enter is always equivalent to `OK`. Space is what you use to select an object when multiple objects can be selected. Tab can be used to move between sections of the UI, such as moving between selections and the `OK` and `Cancel` "buttons."

Also, if you mess up at any point and get kicked out of the setup, just reboot the server and log back in, and the script will restart with the correct setup.

1. Sign in with the credentials created during the OS installation.
2. Press enter.
3. Select `Install` and press enter.
4. Select `Standalone` and press enter.
5. `AGREE` -> press enter.
6. Select `Airgap` and press enter.
7. You can either leave the name as `securityonion` or change it to something else. Whatever it gets set to, it's pretty much locked in. Press enter, and if it prompts you, select `Use Anyway` and press enter.
8. Press enter.
9. The NIC you select here ***MUST*** be the same as you input for the VyOS configuration. If the MAC addresses available don't match, change the configuration in VyOS first by entering `config` and inputting the same line but with an updated MAC address. Press enter.
10. Select `DHCP` and press enter.
11. Since we have a reservation already, we can just press enter with `Yes` selected.
12. Press enter.
13. Press space and then enter.
14. The email you put here does not have to be a real email. I recommend `<firstname>@cybermice.dev`. Once filled out, press enter.
15. Enter a password.
16. Select IP and press enter.
17. Press enter.
18. Type `10.0.0.0/24` and press enter. This adds that network to the list of authorized IPs to access the web app.
19. Press tab and then enter.

This will take a bit, but once it finishes you should be able to connect to it via `http://10.0.4.5` using the email and password you set in steps 14 and 15. In order to verify that everything is running, run `sudo so-status` in the console; additionally, you should be able to ssh into the security onion, if there are no network issues. See [Troubleshooting](#troubleshooting) below for more guidance if you still can't access the site.

## Troubleshooting

1. Verify that everything has come up with a `sudo so-status`.
    * Wait for everything to come up, or if there's an error, proceed to the section that address that specific error.
2. Attempt to ping the host workstation with `ping 10.0.0.2`.
    * If you can ping 10.0.0.250, then you probably need to add a static route to your device. For windows, in an elevated command prompt: `route add 10.0.0.0 mask 255.255.255.248 10.0.0.254`