defmodule ReactOnElixir do
  use Application
  def start(_type, _args) do
    ReactOnElixir.Supervisor.start_link
  end

  def renderComponent(options) when is_list(options) do
    :poolboy.transaction(
      ReactOnElixir.Config.pool_name(),
      fn(pid) -> :gen_server.call(pid, options) end,
      2000
    )
  end
end

