defmodule Readerl.TestFeedController do
  use Readerl.Web, :controller

  def index(conn, _params) do
    render conn, "testfeed.xml"
  end
end
