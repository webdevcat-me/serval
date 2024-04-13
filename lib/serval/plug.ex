defmodule Serval.Plug do
  import Plug.Conn

  @filename "index.html"

  def init(options) do
    # initialize options
    options
  end

  def call(conn, _opts) do
    path = :serval |> Application.fetch_env!(:output_directory) |> Path.join(@filename)

    conn |> put_resp_content_type("text/html") |> send_file(200, path)
  end
end
