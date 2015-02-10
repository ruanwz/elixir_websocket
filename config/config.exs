# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :elixir_websocket, ElixirWebsocket.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JR5tZ2d6HCWYJo+ZfVH0fWqKcF90ru1l+upA/7fA2j/ELqNBv3ELEy7814lpTVO/",
  debug_errors: false,
  server: true

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
