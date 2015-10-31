defmodule Readerl.Fetcher do

  def fetch(url) do
    # I don't like ignoring SSL certificate signing, but even my own
    # web site's CA isn't in Hackney's list.
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://lisplog.org/rss.xml", [], hackney: [:insecure])
    {:ok, feed, _} = FeederEx.parse(body)
    feed
  end
end
