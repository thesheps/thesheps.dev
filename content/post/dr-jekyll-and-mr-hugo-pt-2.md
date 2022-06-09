---
date: 2022-06-09T18:53:38+01:00
author: "Sheps"
title: "Dr. Jekyll and Mr. Hugo - Pt. 2"
summary: "In part 2 of this [very short] series, I shift my content from Jekyll to Hugo!"
tags:
    - meta
    - blogging
    - tech
    - aws
---
This isn't going to be a step-by-step guide where I talk about all the back-and-forth about getting my content outta Jekyll and into Hugo, I'm just going to skip to the end...

<p align="center">
  <img src="https://c.tenor.com/FLFBFq27T60AAAAC/simon-pegg.gif" />
</p>

The process for getting my Jekyll blog moved to Hugo is actually quite elegantly described with a lil code snippet:

```bash
# Initialise a new hugo site under the folder my-site
hugo new site my-site

# Copy across all the markdown files from my old site
mkdir -p my-site/content/post
cp -rip "$OLD_SITE/_posts/*" my-site/content

# Clone down a sexy Hugo theme to use
git clone $THEME_REPO "my-site/themes/$THEME_NAME"

# Configure the hugo site to use the new theme!
cat <<EOT >> my-site/config.toml
baseURL = 'http://example.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
theme = "$THEME_NAME"
EOT
```

Rather than now having to worry about keeping a plethora of Ruby gems kept up to date (sorry, my NodeJS PTSD is leaking again), all I have to do is use the hugo binary to build and deploy!

Tie this together with some Cloudformation to throw out an S3 bucket and Cloudfront distribution, a basic Github action and you got yourself a stew goin' on!

```yaml
name: Deploy to S3

on:
  push:
    branches: [main]

env:
  AWS_REGION: 'eu-west-1'
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Check out
        uses: actions/checkout@main
        with:
          submodules: true

      - name: Deploy Infra
        uses: aws-actions/aws-cloudformation-github-deploy@v1.0.3
        with:
          name: thesheps-dev
          template: website.yml
          no-fail-on-empty-changeset: "1"

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: '0.100.1'

      - name: Build Site
        run: hugo --log --verbose

      - name: Deploy Site
        run: hugo deploy
```