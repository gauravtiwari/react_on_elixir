defmodule ReactOnElixir.Supervisor do
	use Supervisor

  def start_link do
    pool = Application.get_env(:react_on_elixir, :pool)
    global_or_local = Application.get_env(:react_on_elixir, :global_or_local, :global)
    Supervisor.start_link(__MODULE__, [pool, global_or_local])
  end

  def init([pool, global_or_local]) do
    pool_options = [
      name: {global_or_local, pool[:name]},
      worker_module: ReactOnElixir.Worker,
      size: pool[:size],
      max_overflow: pool[:max_overflow]
    ]

    children = [
      :poolboy.child_spec(pool[:name], pool_options, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
