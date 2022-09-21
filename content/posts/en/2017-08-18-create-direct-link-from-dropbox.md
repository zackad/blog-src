---
layout: post
title: "How To Create Direct Link From Dropbox"
category: en
tags: [tutorial]
---
It's easy to create direct link into file uploaded to Dropbox. Here's how to do it.

<div class="youtube-container">
<iframe class="youtube-embed" src="https://www.youtube.com/embed/t4GJTViRSqo" frameborder="0" allowfullscreen></iframe>
</div>

- Login to your Dropbox account
- Navigate to file manager
- Select which file we want to share
- Click Share button
- Click Create Link
- Now we can copy the generated link

All we need to do is to change last parameter to prevent preview mode by Dropbox. The copied link would look like this

```
https://www.dropbox.com/s/42uao1de2rfkgcs/01.%20AdministrasiKota.KML?dl=0
```

change this part `?dl=0` to `?raw=1` so the link become like this

```
https://www.dropbox.com/s/42uao1de2rfkgcs/01.%20AdministrasiKota.KML?raw=1
```

When we access the link, we would be directed to the file immediately.
