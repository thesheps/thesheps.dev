---
date: 2022-06-11T16:31:20+01:00
author: "Sheps"
title: "Let's Build a Url Shortener Pt1"
summary: "In this introductory blog post we talk about the need for URL shorteners, and discuss some of the reasoning around building my own!"
tags:
  - IndieWeb
  - Weekend Projects
---

In the world of the [IndieWeb](https://indieweb.org), ownership of content is King. A lot of the content creators currently contributing (_holy alliteration, batman!_) their articles use some breed of [syndication](https://indieweb.org/Category:syndication) to cross-post their pieces between different hosting providers. The idea here is that you _own_ your original piece in its entirety, choosing instead to post directly to your personal website rather than, say Medium.com. When your new piece is available, you can then decide if you want to [cross-post](https://indieweb.org/cross-posting) to any other channel (twitter, facebook, etc).

With these cross-posts, having to include the entire permalink to your post (for example [https://www.thesheps.dev/post/lets-build-a-url-shortener-pt1/](https://www.thesheps.dev/post/lets-build-a-url-shortener-pt1/)) is super wordy, right? Enter URL shorteners!

A URL shortener is exactly what it says on the tin - They've been around for absolutely ages, and act as a very simple proxy between a lovely, cosmetic URl (like [https://tinyurl.com/yabe4u4r](https://tinyurl.com/yabe4u4r)]), and you're big, disgusting url (like [https://www.thesheps.dev/post/lets-build-a-url-shortener-pt1/](https://www.thesheps.dev/post/lets-build-a-url-shortener-pt1/)).

But what happens if the URL shortening service disappears from the internet? If you're a proponent of a free internet and data ownership, it might be that you want to host your own. And that's cool! There are several options out there for you already ([YOURLS](https://yourls.org/) is one such framework!)

## So why build one from scratch?

### For the lols

I love a little pet project! I was thinking about cutting this in a language I've no experience in, but in the end decided to pick Typescript so I can realistically finish this one!

### Cost

URL shorteners by their definition need a way to relate a URL alias to the "upstream" URL, which in turn will need some sort of hosted database. Whilst this is fine if you have a dedicated IT spent or budget, I wanted to find a way to get something stood up for myself without massively increasing my AWS spend see: [frugality](https://www.linkedin.com/pulse/20141112141927-75052-practice-frugality-amazon-leadership-principle-9/).

### Community contribution

I've taken so much from open source over the years. I wanted a project to call my own that might gain some traction and adoption amongst the IndieWeb community!

## Design Considerations

To close out this post I'm going to switch from long-form so that I can record some simple design decisions.

- Serverless first.
- Deployed by Github Actions.
- Templatable repository for people to Just Use.

---

In the next post I'll discuss a bit more about the "first steps" of getting going with this solution, but we're off out to see a Musical now so I'm gonna stop typing words with my fingers :)
