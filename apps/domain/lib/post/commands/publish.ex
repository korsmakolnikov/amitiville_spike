defmodule Amitiville.Domain.Post.Commands.Publish do
  @enforce_keys [:uuid]
  defstruct [:uuid]

  def build(uuid), do: %__MODULE__{uuid: uuid}
end
