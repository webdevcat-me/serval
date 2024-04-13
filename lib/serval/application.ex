defmodule Serval.Application do
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    Mix.Tasks.Build.run([])

    children = [
      {Plug.Cowboy, plug: Serval.Plug, scheme: :http, options: [port: 4000]}
    ]

    opts = [strategy: :one_for_one, name: Serval.Supervisor]

    Logger.info("Plug now running on localhost:4000")

    Supervisor.start_link(children, opts)
  end
end
