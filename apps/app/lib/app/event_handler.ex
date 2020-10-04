defmodule Amitiville.App.EventHandler do
  use Commanded.Event.Handler,
    application: Amitiville.App.MissionControl,
    name: __MODULE__

  def handle(%Amitiville.Domain.Post.Events.Created{uuid: uuid, text: text}, _metadata) do
    :ok = GenServer.cast(Amitiville.Projector.FakeProkector, {:upsert, %{uuid: uuid, text: text}})
  end

  def handle(%Amitiville.Domain.Post.Events.Updated{uuid: uuid, text: text}, _metadata) do
    :ok = GenServer.cast(Amitiville.Projector.FakeProkector, {:upsert, %{uuid: uuid, text: text}})
  end

  def handle(
        %Amitiville.Domain.Post.Events.Publicated{uuid: uuid},
        _metadata
      ) do
    :ok =
      GenServer.cast(
        Amitiville.Projector.FakeProkector,
        {:publish, %{uuid: uuid}}
      )
  end
end
