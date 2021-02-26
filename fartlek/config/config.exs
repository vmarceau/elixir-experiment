# General application configuration
use Mix.Config

config :fartlek,
  ecto_repos: [Fartlek.Repo]

# Configures the endpoint
config :fartlek, FartlekWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aAmGfvUJ1UX7BQESj/8bfV2cXfir9hlgdDQ2DlzfH00XW+4XSz5QkiiPaWPipBy4",
  render_errors: [view: FartlekWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Fartlek.PubSub,
  live_view: [signing_salt: "9neYaW5l"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
