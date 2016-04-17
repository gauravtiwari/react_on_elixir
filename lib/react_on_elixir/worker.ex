defmodule ReactOnElixir.Worker do
	use GenServer

	def start_link([]) do
	  :gen_server.start_link(__MODULE__, [], [])
	end

	def init(state) do
	  {:ok, state}
	end

	def handle_call(options, _from, state) do
	  result = ReactOnElixir.Renderer.result(
	  	options[:component],
	  	options[:props],
	  	options[:render_type]
	  )
	  {:reply, [result], state}
	end
end
