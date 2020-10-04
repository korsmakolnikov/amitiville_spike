defmodule Amitiville.Projector.FakeProkector do
  use GenServer

  def start_link(_), do: GenServer.start_link(__MODULE__, [], name: __MODULE__)
  def init(init), do: {:ok, init}

  def state, do: GenServer.call(__MODULE__, :read)

  def handle_cast({:upsert, n}, []), do: {:noreply, [n]}

  def handle_cast({:upsert, %{uuid: uuid, text: text} = n}, state) do
    case Enum.find_index(state, &(&1.uuid == uuid)) do
      nil ->
        {:noreply, state ++ [n]}

      i ->
        {:noreply, List.update_at(state, i, &%{uuid: &1.uuid, text: text})}
    end
  end

  def handle_cast({:publish, %{uuid: uuid}}, state) do
    case Enum.find_index(state, &(&1.uuid == uuid)) do
      i when not is_nil(i) ->
        {:noreply, List.update_at(state, i, &%{uuid: &1.uuid, text: &1.text, published: true})}
    end
  end

  def handle_call(:read, _from, state), do: {:reply, state, state}
end
