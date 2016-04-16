defmodule ReactOnElixir do
  use Application

  def start(_type, _args) do
    ReactOnElixir.Supervisor.start_link
  end
end
