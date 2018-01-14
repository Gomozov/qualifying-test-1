defmodule H4cc.Mixfile do
  use Mix.Project

  def project do
    [
      app: :h4cc,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison, :table_rex]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      { :httpoison, "~> 0.9" },
      { :poison, "~> 2.2"},
      { :floki, "~> 0.19.0"},
      { :table_rex, "~> 0.10"}
    ]
  end
end