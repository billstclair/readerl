ReadErl Design
=====

My inspiration for ReadErl was Google Reader. When Google Reader shut down, I added an RSS aggregator to [Lisplog](https://lisplog.org/). That works quite well, for me, but it is configured with a text file containing a lisp list of RSS feed URLs. I want a tool for everybody to use, like Google Reader. I suppose I should survey the field; there are other tools out there. But I'm going to just build something original, and see if anybody wants to use it.

[ReadErl.com](http://ReadErl.com/) is currently running on a $5/month [Digital Ocean](https://www.digitalocean.com/) VM, but I want it to be able to scale big. This has a some implications:

1. The database hides behind an API, with synchronous and asynchronous entry points. I will use [mnesia](http://www.erlang.org/doc/man/mnesia.html) initially, likely via the [Amnesia](https://github.com/meh/amnesia) Elixir wrapper, but I want to be able to switch to [CouchDB](http://couchdb.apache.org/) or [Riak](http://basho.com/products/), if necessary for scale.

2. Pluggable feeds. I'll initially do [RSS](https://en.wikipedia.org/wiki/RSS) and [Twitter](https://dev.twitter.com/overview/documentation). I'd like to add [Medium](https://medium.com/), but right now the only way to do that is to screen scrape the HTML. Hopefully, they'll fix that soon, by expanding their API to allow more than just posting, or [shipping recommended stories](https://ifttt.com/recipes/331251-tweet-medium-stories-you-ve-recommended) to [IFTTT](https://ifttt.com/).

I was originally going to write ReadErl in Erlang, with the [Chicago Boss](http://chicagoboss.org/) web framework. Then I discovered [Elixir](http://elixir-lang.org/) and [Phoenix](http://www.phoenixframework.org/). [Popeye](https://en.wikipedia.org/wiki/Popeye), meet [Jessica Rabbit](https://en.wikipedia.org/wiki/Jessica_Rabbit).

Reminder links:

* [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/)
* [Daring Fireball's Markdown Docs](https://daringfireball.net/projects/markdown/basics)

Initial exploratory tasks:

1. Write some code to use [atomizer](https://github.com/ipinak/atomizer) to parse RSS feeds.

2. Switch the dummy [ReadErl.com](http://ReadErl.com) web page from static HTML to Phoenix. [**done**]

3. Design the feed plugin API.

4. Build the RSS plugin.

5. Work on the web interface allowing creation of user accounts, and addition of feeds.

6. Write the code that periodically pulls in, parses, and stores in the database, all the known feeds.

7. Write the code that creates the feed web page from a user's feeds.

8. Add Twitter feeds (with [twitter_kit](https://github.com/billstclair/twitter_kit)).

9. Go live.

10. Profit (Google ads and monthly payments to disable them or get more history)

11. Add an external API for aggregated feeds, likely as RSS.

Other features, a grab bag as I think of them:

* Multiple named feeds per user.

* Public URLs for a subset of your named feeds. Global names, first come first served, and /&lt;you>/&lt;name>, where &lt;name> defaults to what you call it internally, but can be different.

* An RSS feed for each of those public URLs.

* JavaScript to insert a public feed on your web site. This probably already exists.
