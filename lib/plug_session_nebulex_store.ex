defmodule Plug.Session.Nebulex do
  @moduledoc """
  Stores the session in an in-memory ETS table.
  This store does not create the ETS table; it expects that an
  existing named table with public properties is passed as an
  argument.
  We don't recommend using this store in production as every
  session will be stored in ETS and never cleaned until you
  create a task responsible for cleaning up old entries.
  Also, since the store is in-memory, it means sessions are
  not shared between servers. If you deploy to more than one
  machine, using this store is again not recommended.
  This store, however, can be used as an example for creating
  custom storages, based on Redis, Memcached, or a database
  itself.
  ## Options
    * `:table` - ETS table name (required)
  For more information on ETS tables, visit the Erlang documentation at
  http://www.erlang.org/doc/man/ets.html.
  ## Storage
  The data is stored in ETS in the following format:
      {sid :: String.t, data :: map, timestamp :: :erlang.timestamp}
  The timestamp is updated whenever there is a read or write to the
  table and it may be used to detect if a session is still active.
  ## Examples
      # Create an ETS table when the application starts
      :ets.new(:session, [:named_table, :public, read_concurrency: true])
      # Use the session plug with the table name
      plug Plug.Session, store: :ets, key: "sid", table: :session
  """

  @behaviour Plug.Session.Store

  # Types

  @typedoc """
  The internal reference to the session in the store.
  """
  @type sid :: term | nil

  @typedoc """
  The cookie value that will be sent in cookie headers. This value should be
  base64 encoded to avoid security issues.
  """
  @type cookie :: binary

  @typedoc """
  The session contents, the final data to be stored after it has been built
  with `Plug.Conn.put_session/3` and the other session manipulating functions.
  """
  @type session :: map

  # Functions

  # Callbacks
  @impl true
  @spec init(Plug.opts()) :: Plug.opts()
  def init(arg1) do
    opts = Application.get_env(:plug_session_nebulex, :redis, [])
  end

  @impl true
  @spec put(Plug.Conn.t(), sid(), any(), Plug.opts()) :: cookie()
  def put(arg0, sid, any, arg3) do
  end

  @impl true
  @spec get(Plug.Conn.t(), cookie(), Plug.opts()) :: {sid(), session()}
  def get(arg0, cookie, arg2) do
  end

  @impl true
  @spec delete(Plug.Conn.t(), sid(), Plug.opts()) :: :ok
  def delete(arg0, sid, arg2) do
  end
end
