defmodule Mix.Tasks.BuildTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  @filename "index.html"

  @markup """
  <!-- Auto-generated fixture -->
  <!DOCTYPE html>
  <html>
    <body>hello world</body>
  </html>
  """

  setup_all do
    output_dir = "public"
    file_path = Path.join(output_dir, @filename)

    original = Application.fetch_env!(:serval, :output_directory)
    Application.put_env(:serval, :output_directory, "public")

    on_exit(fn ->
      Application.put_env(:serval, :output_directory, original)
      File.rm_rf!(tmp_path())
    end)

    [context: "build", output_dir: output_dir, file_path: file_path]
  end

  test "creates output files", %{context: context, file_path: file_path} do
    in_tmp(context, fn ->
      File.write!(@filename, @markup)

      capture_io(fn -> Mix.Tasks.Build.run([]) end)

      assert File.exists?(file_path)
    end)
  end

  test "updates output files", %{file_path: file_path} = context do
    in_tmp(context[:context], fn ->
      File.mkdir_p!(context[:output_dir])
      File.write!(file_path, @markup)

      File.write!(@filename, """
      <!-- Auto-generated fixture -->
      <!DOCTYPE html>
      <html>
        <body>welcome</body>
      </html>
      """)

      capture_io(fn -> Mix.Tasks.Build.run([]) end)

      assert File.read!(file_path) =~ "welcome"
    end)
  end

  defp tmp_path do
    Path.expand("../tmp", __DIR__)
  end

  defp tmp_path(extension) do
    Path.join(tmp_path(), extension)
  end

  defp in_tmp(which, function) do
    path = tmp_path(which)
    File.rm_rf!(path)
    File.mkdir_p!(path)
    File.cd!(path, function)
  end
end
