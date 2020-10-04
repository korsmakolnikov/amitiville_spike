import Config

config :app, Amitiville.App.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "amitiville",
  password: "amitiville",
  database: "eventstore",
  hostname: "postgres",
  pool_size: 10

config :app, event_stores: [Amitiville.App.EventStore]
