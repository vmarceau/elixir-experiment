use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :fartlek, Fartlek.Repo,
  hostname: System.get_env("ELIXIR_DB_HOST"),
  username: System.get_env("ELIXIR_DB_USER"),
  password: System.get_env("ELIXIR_DB_PASS"),
  port: System.get_env("ELIXIR_DB_PORT"),
  database: "fartlek_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fartlek, FartlekWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

use Mix.Config

config :fartlek, FartlekWeb.Auth.Guardian,
  issuer: "fartlek",
  secret_key: "fc8spb1voGdhOrnKOuv1F4ljgVJB0LGDxecceEjsOwbB+O2oePt+iJZJIJt94OTh"
