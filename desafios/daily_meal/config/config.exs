# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :daily_meal,
  ecto_repos: [DailyMeal.Repo]

config :daily_meal, DailyMeal.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :daily_meal, DailyMealWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XsKn8dCBWSKamUUImEOWzUqH4tf20X504TTWBnUNRK498A9NMyjE9HkGl+RNqtgZ",
  render_errors: [view: DailyMealWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DailyMeal.PubSub,
  live_view: [signing_salt: "jLwBcF3P"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
