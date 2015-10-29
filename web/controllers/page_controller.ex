defmodule Readerl.PageController do
  use Readerl.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
