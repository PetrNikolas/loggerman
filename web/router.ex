defmodule Loggerman.Router do
  use Loggerman.Web, :router

  # Pipelines
  pipeline :api do
    plug :accepts, ["json"]
  end

  # Homepage - root
  scope "/", Loggerman do
    pipe_through :api

    get "/", IndexController, :index
  end

  # API endpoints
  scope "/api", Loggerman do
    pipe_through :api

    # Logs endpoints
    post "/logs", LogsController, :index
  end
end
