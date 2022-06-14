---
date: 2022-06-14T07:59:58+01:00
author: "Sheps"
title: "Lets Build a Url Shortener Pt3 - MVP Reflection"
summary: "MVP kinda done? In part 3 of this series we look back on the MVP and see what milestones we've hit!"
tags:
  - IndieWeb
  - Weekend Projects
  - Linkr
  - URL shorteners
---

Alright! Well my fun weekend task took a leetle more than the fun weekend, but it's released! A user can:

- Provision a short url for a given long url using an `x-api-key` header (securely stored in AWS Secrets Manager).
- Navigate to the _short_ url and have it redirect the user to the target _long_.
- Have the usage of this short url (crudely) tracked via a hit counter in DynamoDB.

## What's next?

Next up I need to figure out how I can wire this new shortener into my Hugo workflow. I'm thinking initially that I can accomplish this using a new Hugo archetype and a bit of bash? So I'll probably go with that option first and see where that takes me!

Other than that I'm sure that I'm missing some tests and documentation here and there so I'll spend some time finalising all that before we can call this MVP _done done done_.

I'll add a roadmap to the docs of my repo sometime soon, too! You can find all the supporting code for this over [on my github](https://github.com/thesheps/linkr).

Signing off for now as it's too sunny outside and I can't read my screen!
