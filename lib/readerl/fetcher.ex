defmodule Readerl.Fetcher do

  @doc "Fetch URL, a string, and parse it as RSS. Return a %FeederEx.Feed{}"
  def fetch(url) do
    # I don't like ignoring SSL certificate signing, but even my own
    # web site's CA isn't in Hackney's list.
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get(url, [], hackney: [:insecure])
    {:ok, feed, _} = FeederEx.parse(body)
    feed
  end

end
