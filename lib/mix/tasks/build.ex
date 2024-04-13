defmodule Mix.Tasks.Build do
  @moduledoc "Creates a /public directory and places a copy of index.html there"
  @shortdoc "Builds static website files"

  use Mix.Task

  @filename "index.html"

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info("Building markup...\n  " <> @filename)

    output_directory = Application.fetch_env!(:serval, :output_directory)

    File.mkdir_p!(output_directory)
    File.cp!(@filename, Path.join(output_directory, @filename))

    Mix.shell().info("Done.")
  end
end
