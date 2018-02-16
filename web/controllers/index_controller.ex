defmodule Loggerman.IndexController do
  use Loggerman.Web, :controller
  
  def index(conn, params) do
    company = %{Title: "LoggerMan"}

    json conn, company
  end
end