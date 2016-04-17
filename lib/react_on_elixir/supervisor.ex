defmodule ReactOnElixir.Supervisor do
	use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    pool_options = [
      name: {ReactOnElixir.Config.pool_type(), ReactOnElixir.Config.pool_name()},
      worker_module: ReactOnElixir.Worker,
      size: ReactOnElixir.Config.pool_size(),
      max_overflow: ReactOnElixir.Config.pool_maxoverflow()
    ]

    children = [
      :poolboy.child_spec(ReactOnElixir.Config.pool_name(), pool_options, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
