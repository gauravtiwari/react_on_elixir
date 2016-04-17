defmodule ReactOnElixir.Mixfile do
  use Mix.Project

  @version String.strip(File.read!("VERSION"))

  def project do
    [app: :react_on_elixir,
     version: @version,
     elixir: "~> 1.2",
     description: "Server render react components from Elixir",
     build_embedded: (Mix.env == :prod),
     package: package,
     start_permanent: (Mix.env == :prod),
     deps: deps]
  end

  def application do
    [ mod: {ReactOnElixir, []},
      applications: [:logger, :poolboy, :porcelain]
    ]
  end

  defp deps do
    [
      {:poolboy, "~> 1.5"},
      {:poison, "~> 1.5.2"}
    ]
  end

  defp package do
    [files: ~w(lib priv mix.exs README.md UNLICENSE VERSION),
     maintainers: ["Gaurav Tiwari"],
     licenses: ["Unlicense"],
     links: %{"GitHub" => "https://github.com/gauravtiwari/react_on_elixir"}]
  end
end
