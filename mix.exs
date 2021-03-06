defmodule TweetMachine.Mixfile do
  use Mix.Project

  def project do
    [
      app: :tweet_machine,
      version: "0.1.0",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :quantum],
      mod: {TweetMachine.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:credo, "~> 0.8.7"},
      {:quantum, "~> 1.9.3"},
      {:envy, "~> 1.1.1"},
      {:extwitter, "~> 0.8.6"},
      {:mock, "~> 0.3.1"},
      {:mix_test_watch, "~> 0.5.0"}
    ]
  end
end
