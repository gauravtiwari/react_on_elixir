defmodule ReactOnElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :react_on_elixir,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:execjs, "~> 1.1.3"},
      {:poolboy, "~> 1.5"}
    ]
  end
end
