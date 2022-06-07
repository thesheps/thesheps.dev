---
date: 2022-06-07T18:24:46+01:00
author: "Sheps"
title: "Dr. Jekyll and Mr. Hugo - Pt. 1"
summary: "Trying to make blogging fun again! I decided this blog needed some titivation, and realised that my Jekyll configuration was super brittle. This post talks about how I migrated to Hugo following the stellar advice by the awesome [Jamie Tanna](https://www.jvt.me)!"
tags:
    - meta
    - blogging
    - tech
    - aws
---
Trying to make blogging fun again! I decided this blog needed some titivation, and realised that my Jekyll configuration was super brittle. This post talks about how I migrated to Hugo following the stellar advice by the awesome [Jamie Tanna](https://www.jvt.me)!

So first things first! The previous incarnation of this blog was deployed to [GitHub Pages](https://pages.github.com/), using an off-the-shelf [Jekyll](https://jekyllrb.com/) theme. Now there's nothing _wrong_ with Jekyll _or_ GitHub Pages, and it can get you a hell of a long way to where you need to be! There are a few reasons that I wanted to move away from them, though.

## Ruby Configuration
As powerful and configurable as the Jekyll engine is, I was finding that in order to make any meaningful change to my site I needed to have a pretty good working knowledge of the Ruby ecosystem. Now I'm not at _all_ opposed to learning a new language, but I felt like this was a bit of a barrier to entry for getting my blog online and being able to iterate on it quickly. Similarly I was having some horrible issues with my M1 Mac and getting it setup locally which just left a _bad taste_ in my mouth.

## Confusing Theme Setup
Again it's another reservation about theming in general, but finding that the Jekyll themes I was working with favoured [Sass](https://sass-lang.com), which felt again pretty brittle and opionated about how to colour-in my blog. Finding a blog engine which favours vanilla [CSS](https://www.w3.org/Style/CSS/Overview.en.html) instead of an abstraction is another item on my hitlist.

## Ownership
[Jamie Tanna](https://www.jvt.me/posts/2019/10/20/indieweb-talk/) has spoken about this in way more depth than I wanted to cover here, so I'll keep this brief! One of the reasons I wanted to move away from GitHub Pages is so that I have a place for all my content to live which is unshackled from being hosted under someone else's banner.

So these are the reasons why I wanted to start migrating my blog to somewhere that I can host and run myself. Stay tuned for part 2 which details a little more about the process I used to migrate the content outta Jekyll and into Hugo!