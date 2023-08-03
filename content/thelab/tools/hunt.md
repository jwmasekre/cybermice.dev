---
title: "Hunt"
date: 2023-07-29T22:28:01-05:00
weight: 30
---

The Hunt page gives you significantly more control over the presentation of alert data, and also opens up access to the data that the alerts are generated from. Typically, you arrive at the Hunt page via the Action menu via [Alerts](./alerts), but you can start here if you know what you're looking for, or even just are familiar with the Onion Query Language (OQL). To see this in action (and get a good idea of what types of data are available to you), you can change the query to `* | groupby event.module* event.dataset`, which should give you some system, zeek, elastic, kratos, and (if you have alerts already), suricata module data.

The Base Metrics is simply some graphs displaying the most common, least common (useful for long tail analysis), and when logs were generated.

Group Metrics is where the groupings in the query are displayed. This section always has a Count field, and is also where you can bulk escalate to a [Case](./cases). In practice, once you've narrowed down the groupings to all (and only) the the logs worth investigating, you'll want to escalate all of them en masse. You can also escalate to an already created case in the same menu (though you have to have opened it on the [Cases](./cases) page).

At the bottom is the Events section, which yields the individual logs and a couple of highlight fields to sort by. Each log can be expanded and all fields can be viewed, with filtering and grouping options available there.

This page is also where the filters and groups in the left-click menu are most useful. **Include** is a logical `AND`, **Exclude** is a logical `NOT`, and **Only** wipes out the current search (except for the groupings). This means that Only, counterintuitively, tends to yield *more* results than Include. It's also worth noting that Include/Exclude filter by the field (ie: choosing Include on kratos in the event.module column adds ` AND event.module:"kratos"`), but Only searches by just the text (ie: choosing Only on the same entry just changes the search to `"kratos"`). This means that Only can sometimes return more info than expected or desired, so it can be useful to use Include for the syntax of the search and then wipe out everything from the `AND` to the beginning to approximate the expected results.
