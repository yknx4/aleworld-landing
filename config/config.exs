# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :aleworld,
  ecto_repos: [Aleworld.Repo]

# Configures the endpoint
config :aleworld, AleworldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8c0faKivd2+mfr2yYPUmxdZlp/4ifT7sspzXTVpZ1xCWzayTsWSYE8uxAU/PeuJK",
  render_errors: [view: AleworldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Aleworld.PubSub,
  live_view: [signing_salt: "wFL6HeDt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
