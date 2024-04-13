defmodule Serval.MixProject do
  use Mix.Project

  def project do
    [
      app: :serval,
      version: "0.1.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      env: [output_directory: "/public"],
      extra_applications: [:logger],
      mod: mod(Mix.env())
    ]
  end

  defp elixirc_paths(:prod), do: ["lib/mix/tasks"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:plug_cowboy, "~> 2.0", only: [:dev, :test]}
    ]
  end

  defp mod(:dev), do: {Serval.Application, []}
  defp mod(_), do: []
end
