---
title: "Cases"
date: 2023-07-29T22:28:01-05:00
weight: 40
---

This is where you can view all cases that were escalated to via [Alerts](./alerts) and [Hunt](./hunt), as well as creating new ones from scratch. To access the case, click the binoculars icon on the left of the line.

Inside of the case you have 5 tabs: Comments, Attachments, Observables, Events, and History. Comments are used to document any observations, recommendations, or any other notes that may be relevant that aren't covered by the other tabs

Attachments are for files that are relevant to the investigation. This could be packet captures, malware, memory dumps, or whatever might need to be referenced or reviewed. Note that this is pretty severely limited to 25MB, so a lot of potentially useful files cannot be uploaded (though this may be configurable, the cases screen is new as of 2.4 and there isn't as much content about it available yet). When uploading the file, you have the option to zip the file (to help prevent analysts accidentally executing malicious content), provide a description, assign a TLP (traffic light protocol) color, and add some tags. Once uploaded, the description, TLP, tags, and zip protection are editable, and it also returns several file hashes. The file hashes can be added as observables using the eye icon next to them, or just copied for further investigation. (Further investigation is warranted on these; the Action menu in [Alerts](./alerts) and [Hunt](./hunt) is customizable, and customizing these to allow direct searching of hashes in VirusTotal may be valuable.)

Observables is relevant data that isn't a file, though it may include content in a file or a reference to a file (such as a file hash). When escalating logs or alerts, The tooling attempts to automatically populate the Observables with potentially important information, such as IP addresses. This tab is critical for documenting not just evidence but false positives and dead-end tangents to prevent work from being duplicated. Analysts can also leverage the Actions column to pivot into [Hunt](./hunt) or start an "analyze job", which outputs its findings inside the observable. It performs some analysis on the observable based on the type of observable. When manually adding an observable, you can choose the type (out of 15 different types, including "other"), add one or more values (if adding multiple, such as a list of file hashes, there is a checkbox for making each new line its own observable), a description, whether or not it's an IoC, a TLP indicator, and additional tagging.

Events are the lines that were escalated in [Alerts](./alerts) and/or [Hunt](./hunt). It includes exactly what was visible when it was added, including the count, and enables you to add each field as an observable or [hunt](./hunt) on the specific value of the field. Events can **only** be added from the Escalate option.

History is a log of who does what in the case. This is useful for asking for clarifying information from an analyst, or even for crediting exceptional findings and analysis.