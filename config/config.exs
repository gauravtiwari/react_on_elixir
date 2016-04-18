use Mix.Config
config :react_on_elixir,
  pool: [
  	{:name, :react_render},
  	{:type, :local},
  	{:size, 10},
  	{:max_overflow, 10}
  ]
config :elixir_v8,
	pools: [
	  main: [
	    {:size, 10},
	    {:max_overflow, 10}
	  ]
	]
