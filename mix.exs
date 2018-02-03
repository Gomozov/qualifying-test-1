defmodule H4cc.Mixfile do
  use Mix.Project

  def project do
    [
      app: :h4cc,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),

      # Docs
      name: "H4cc",
      source_url: "https://github.com/Gomozov/qualifying-test-1"
    ]
  end

  def application do
    [
      extra_applications: [:logger, :httpoison, :table_rex]
    ]
  end

  defp deps do
    [
      { :httpoison, "~> 0.9" },
      { :poison, "~> 2.2"},
      { :table_rex, "~> 0.10"},
      { :ex_doc, "~> 0.16", only: :dev, runtime: false},
      { :credo, "~> 0.9.0-rc1", only: [:dev, :test], runtime: false}
    ]
  end
end
