defmodule Mix.Tasks.Data.Ingest.List do
  use Mix.Task
  import Logger

  @shortdoc "Reads a data file into table_name field_name"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    Mix.shell().info("Starting CryptoAsset import...")
    Mix.Task.run("app.start")
    file_path = Path.expand("assets/static/data/designers.txt", "./../designers/")
    file_data = File.stream!(file_path)
    path = file_data.path
    IO.puts(path)

    cond do
      file_data == nil ->
        error_msg = "Could not load list from file, the data is #{file_data}"
        Logger.error(error_msg)
        {:error, error_msg}

      true ->
        file_data
        |> Stream.map(&String.trim/1)
        |> Stream.with_index()
        |> Stream.map(fn {line, file_path} ->
          case Designers.Repo.insert(%Designers.Designers.Designer{
                 name: line,
                 name_length: Integer.to_string(String.length(line))
               }) do
            {:ok, designer} ->
              Logger.info("#{line} loaded from file #{file_path}.")
              {:ok, designer}

            {:error, _} ->
              error_msg = "FAILED to load #{line} from file #{file_path}."
              Logger.error(error_msg)
              {:error, error_msg}

            _ ->
              error_msg = "FAILED to load #{line} from file #{file_path}."
              Logger.error(error_msg)
              {:error, error_msg}
          end
        end)
        |> Stream.run()
    end
  end
end
