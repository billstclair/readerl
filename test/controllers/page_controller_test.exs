defmodule Readerl.PageControllerTest do
  use Readerl.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "ReadErl"
  end

  test "GET /about" do
    conn = get conn(), "/about"
    assert html_response(conn, 200) =~ "About ReadErl"
  end

  test "GET /testfeed.xml" do
    conn = get conn(), "/testfeed.xml"
    assert conn.status == 200
    assert get_resp_header(conn, "content-type") == ["text/xml; charset=utf-8"]
    assert conn.resp_body =~ "<title>Lisplog</title>"
  end
end
