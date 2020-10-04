defmodule Amitiville.App.MissionControl do
  use Commanded.Application,
    otp_app: :app,
    name: __MODULE__,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: Amitiville.App.EventStore
    ]

  router(Amitiville.App.Router)
end
