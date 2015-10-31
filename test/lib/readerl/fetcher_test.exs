defmodule Readerl.FetcherTest do
  use Readerl.ConnCase          # Only need "test & "assert" macros, not all this

  test "Parse testfeed.xml" do
    # This should fetch our local port from somewhere, and build the URL
    rss = Readerl.Fetcher.fetch("http://localhost:4000/testfeed.xml")
    assert rss.language == "en"
    assert rss.link == "http://lisplog.org/"
    assert rss.summary == "Blogging in Lisp"
    assert rss.title == "Lisplog"
    entry = hd(rss.entries)
    assert entry.link == "http://lisplog.org/readerl_is_live.html"
    assert entry.title == "ReadErl Is Live"
    assert entry.updated == "Sat, 31 Oct 2015 02:30:20 GMT"
    assert entry.summary =~ "As my first Erlang project"
  end
end
