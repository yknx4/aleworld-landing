defmodule AleworldWeb.PageController do
  use AleworldWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
