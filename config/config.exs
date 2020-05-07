# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config
import_config "env.local.exs"

config :catcasts,
  ecto_repos: [Catcasts.Repo]

# Configures the endpoint
config :catcasts, CatcastsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bo+l+quiZajS0ToukK1KONyEFTwdgFrjcBWtOYgWqvzSJB3FbVLHDSu26zsSuPER",
  render_errors: [view: CatcastsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Catcasts.PubSub,
  live_view: [signing_salt: "TT3epR7R"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile plus.me"]}
  ]
config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

  # Configure Rummage Phoenix
config :rummage_ecto, Rummage.Ecto,
  default_repo: Catcasts.Repo,
  default_per_page: 5


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
