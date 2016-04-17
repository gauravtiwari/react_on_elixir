use Mix.Config
config :react_on_elixir,
  pool: [
  	{:name, :react_render},
  	{:type, :local},
  	{:size, 10},
  	{:max_overflow, 10}
  ]
