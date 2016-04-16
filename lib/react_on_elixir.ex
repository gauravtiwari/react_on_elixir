defmodule ReactOnElixir do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(ReactOnElixir.Worker, [arg1, arg2, arg3]),
    ]

    opts = [strategy: :one_for_one, name: ReactOnElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
