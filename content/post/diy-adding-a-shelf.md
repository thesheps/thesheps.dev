---
date: 2022-06-14T18:33:48+01:00
author: "Sheps"
title: "DIY - Adding a Shelf!"
summary: ""
tags:
tags:
  - indie-web
  - ownership
  - reading
  - hugo
---

So I've made my first, hesitant steps towards a more [IndieWeb](https://indieweb.org/). I've migrated my existing posts out of a `Github Pages` site to my own `Hugo`-based system, and I've written my own (very simple!) URL shortener with the idea that I can truly make a start on owning my own data. The next step along the journey is to try and gain an understand of _where my data is_, and if I can try and establish a path towards POSSE (Publish Own Site, Syndicate Elsewhere).

I've _also_ come to realise that I've let my reading stall, horribly! With this in mind I thought why not try and own the data I've _already published_ to GoodReads? My shelves, my reading progress, everything. Wouldn't it be cool if I could publish my reading progress to my own site first and have this pushed elsewhere? As I'm still getting to grips with Hugo i thought a Fun Evening Project™️ could be to export my shelves outta Goodreads and get them published as a new [Hugo Archetype](https://gohugo.io/content-management/archetypes/)!

## Step 1 - Get the Data

Happily GoodReads has a nice import/export feature. By logging into my account and hitting the tools on the left-hand page, I was easily able to obtain a CSV:

```csv
Book Id,Title,Author,Author l-f,Additional Authors,ISBN,ISBN13,My Rating,Average Rating,Publisher,Binding,Number of Pages,Year Published,Original Publication Year,Date Read,Date Added,Bookshelves,Bookshelves with positions,Exclusive Shelf,My Review,Spoiler,Private Notes,Read Count,Recommended For,Recommended By,Owned Copies,Original Purchase Date,Original Purchase Location,Condition,Condition Description,BCID
53503544,The Big Sleep (Philip Marlowe #1),Raymond Chandler,"Chandler, Raymond",,"=""""","=""""",0,3.96,,Kindle Edition,173,2020,1939,,2022/04/11,currently-reading,currently-reading (#7),currently-reading,,,,1,,,0,,,,,
22698053,A Man Called Ove,Fredrik Backman,"Backman, Fredrik",Henning Koch,"=""""","=""""",5,4.36,Sceptre,Kindle Edition,304,2014,2012,2022/04/10,2022/02/22,,,read,,,,1,,,0,,,,,
42583886,Where the Crawdads Sing,Delia Owens,"Owens, Delia",,"=""""","=""""",5,4.45,Corsair,Kindle Edition,379,2018,2018,2022/02/22,2021/08/08,,,read,,,,1,,,0,,,,,
944334,All My Friends are Superheroes,Andrew Kaufman,"Kaufman, Andrew",,"=""1552451305""","=""9781552451304""",0,3.81,Coach House Press,Paperback,120,2003,2003,,2022/02/21,to-read,to-read (#82),to-read,,,,0,,,0,,,,,
```

So far so... very very unreadable. The end goal of this is to somehow get this list of books in a markdown-compatible shape so that it's easy (and also sexy!) to read! Better take a look at what format I _actually_ what the markdown to look like...

## Step 2 - Define the Archetype

So I'd quite like a new section on my site which is called `bookshelf` or something. The lister will show the title, author, progress, rating (if applicable!), and clicking through any thoughts I might've had.

So first, we need a Hugo _Archetype_. An archetype helps you define the front-matter template for your New Thing, alongside you can configure the styling of the _single_ item in addition to the _lister_! For this I added a new layout "bookshelf" and just started with the list.html partial. I think my shelf lister archetype is going to look like:

```markdown
---
author: "Sheps"
title: "My Book"
status: "Read"
---
```

And my lister partial (at least to begin with!) will look like:

```html
{{ define "main" }}
<header class="content__header">
	<h1>{{ .Title | markdownify }}</h1>
	{{ .Content }}
</header>

<table>
	<thead>
		<th>Author</th>
		<th>Title</th>
		<th>Status</th>
	</thead>

	<tbody>
		{{ range .Pages }}
		<tr>
			<td>{{ .Params.author }}</td>
			<td><a href="{{ .Permalink }}">{{ .Title }}</a></td>
			<td>Read</td>
		</tr>
		{{ end }}
	</tbody>
</table>
{{ end }}
```

For now just a basic template which shows `Author`, `Title` and `"Status"` (if it's read or unread etc). Dead basic!

## Step 3 - Map the data!

As mentioned before the data exported from Goodreads is a bit _grim_. We need to now be able to map it to extract 3 pieces of information. Author, Title and Status. We also need to be able to write each of these books to a file, maybe named after the book? So first things first, let's script up the creation of the [empty] files. A lil bit of bash is useful here, together with a tool called `miller`:

```bash
# First we map the csv into JSON structure
mlr --c2j --jlistwrap cat goodreads_library_export.csv \
    # Pull out the title of the book
    | jq '.[].Title' -r \

    # Use tr to map all uppers to lowers
    | tr '[:upper:]' '[:lower:]' \

    # Replace all spaces with dashes
    | tr ' ' '-'

    # Stitch ".md" onto the end of the string
    | sed -e 's/$/.md/'
```

This is only half the job, but my eyes are tired.
