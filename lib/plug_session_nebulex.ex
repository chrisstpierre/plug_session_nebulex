defmodule PlugSessionNebulex do
  @moduledoc """
  Documentation for PlugSessionNebulex.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PlugSessionNebulex.hello()
      :world

  """

  use Application

  @impl true
  def start(_type, _args) do
    Supervisor.start_link(
      [Cleaner],
      strategy: :one_for_one,
      name: PlugSessionMnesia.Supervisor
    )
  end
end
