use Mix.Config
config :react_on_elixir,
	server_bundle_path: Mix.Project.app_path <> "/priv/static/js/app-server.js",
	renderer_path: Mix.Project.app_path <> "/priv/renderer.js.eex",
  pool: [
  	{:name, :react_render},
  	{:type, :local},
  	{:size, 10},
  	{:max_overflow, 10}
  ]
