---
title: "Hide Fullpath From Project Explorer on Jetbrains IDE"
date: 2024-12-28T08:05:24+07:00
---

- Open menu `Help -> Edit Custom Properties...` or you can use _Search Everywhere_ feature by double tap `Shift` key
- Put this code
```
project.tree.structure.show.url=false
```
- Restart IDE

{{<figure caption="Before" src="/assets/images/jetbrains-ide/before.png">}}
{{<figure caption="After" src="/assets/images/jetbrains-ide/after.png">}}

Ref: https://stackoverflow.com/questions/40699438/hide-full-path-next-to-project-in-intellij
