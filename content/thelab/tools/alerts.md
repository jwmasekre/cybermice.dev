---
title: "Alerts"
date: 2023-07-29T22:28:01-05:00
weight: 10
---

This is where alerts from various sources are aggregated. If you attempted to ping anything in your troubleshooting, you may already see a Suricata alert here. This is typically your launching off point for investigations. By default, it groups alerts by the `rule.name` and `event.module`, but other types of groupings can be selected. These can be useful for better understanding the data without looking at all the logs (similar to how looking at netflow data can be more efficient than looking at pcaps).

Most everything is self-explanatory, but there are a few things worth pointing out. First, the bell icon acknowledges all alerts represented by the line it's on. If you have 200 pings grouped together and click the bell, they all disappear from this view. Second, the blue triangle escalates all the alerts represented by the line it's on into a [case](./cases). Some strategy is discussed on [the Hunt](./hunt) page. It has a similar behavior to the bell otherwise. If you want to view acknowledged and escalated alerts, the Options dropdown at the top allows you to do so; you can also set up automatic refreshing, in case you're just monitoring. The "Temporarily enable advanced interface features" option provides you with some metrics and the ability to build your own custom queries.

The last thing to point out is the left-click menu. Left-clicking on an alert will bring up a menu with a couple of filter options (Include, Exclude, and Only), the Drilldown option which lets you look at the full alerts, additional grouping options (Group By, New Group By), some copy methods in the Clipboard menu, and several links with the data you clicked on embedded in it in the Actions menu.

Drilldown is likely the first thing you'll do as an analyst to dig into the alert and perform some initial triage. This turns the group into a filter, and by expanding each alert (the arrow on the left-most side of the alert) you can view every field and even group the alerts by any interesting fields. This is also where the left-click menu gets the most utility; since you can see every field, you can leverage the links for whatever data you want to investigate.

If you need more granularity or flexibility, however, use [the Hunt](./hunt) page.
