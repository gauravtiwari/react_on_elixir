defmodule ReactOnElixir.Config do
	def pool_name() do
		pool_config()[:name] || :react_renderer
	end

	def server_bundle_path() do
		Application.get_env(:react_on_elixir, :server_bundle_path)
	end

	def renderer_path() do
		Application.get_env(:react_on_elixir, :renderer_path, Path.join(["#{:code.priv_dir(:react_on_elixir)}"]))
	end

	def pool_maxoverflow() do
	  pool_config()[:max_overflow] || 10
	end

	def pool_size() do
	  pool_config()[:size] || 10
	end

	def pool_type() do
	  pool_config()[:type] || :local
	end

	def pool_config() do
	  Application.get_env(:react_on_elixir, :pool)
	end
end
