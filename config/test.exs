use Mix.Config

config :my_app, MyApp.MyCache,
  n_shards: 2,
  gc_interval: 3600

config :plug_session_nebulex, :config
  nebulex_store: PlugSessionRedisStore.Generator.StrongRandBytes,
