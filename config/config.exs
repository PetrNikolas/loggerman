# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.

# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :loggerman,
  ecto_repos: [Loggerman.Repo]

# Configures the endpoint
config :loggerman, Loggerman.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UQlbYBQ5ibtq5H3hFDP3Jls7oIYIXet81aA1rvblC50U0uq5GVz0jLLrlQvG5W5l",
  render_errors: [view: Loggerman.ErrorView, accepts: ~w(json)],
  pubsub: [name: Loggerman.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
