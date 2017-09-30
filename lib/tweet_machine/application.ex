defmodule TweetMachine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    unless Mix.env == :prod do
      Envy.auto_load
    end
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: TweetMachine.Worker.start_link(arg)
      # {TweetMachine.Worker, arg},
      worker(TweetMachine.TweetServer, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TweetMachine.Supervisor]
    process = Supervisor.start_link(children, opts)
    TweetMachine.Scheduler.schedule_file(
      "* * * * *",
      Path.join("#{:code.priv_dir(:tweet_machine)}", "sample.txt")
    )
    process
  end
end
