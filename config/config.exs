use Mix.Config
config :react_on_elixir,
  pool: [
  	{:name, :react_render},
  	{:global_or_local, :local},
  	{:size, 10},
  	{:max_overflow, 10}
  ],
  server_bundle_path: Mix.Project.app_path <> "/priv/static/js/app-server.js"

