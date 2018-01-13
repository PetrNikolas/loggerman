defmodule Loggerman.IndexController do
  use Loggerman.Web, :controller
  
  def index(conn, params) do
    company = %{Title: "LoggerMan", Params: params}

    json conn, company
  end
end