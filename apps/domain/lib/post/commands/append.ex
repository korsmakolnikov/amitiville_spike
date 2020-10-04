defmodule Amitiville.Domain.Post.Commands.Append do
  @enforce_keys [:uuid, :text]
  defstruct [:uuid, :text]

  def build(uuid, text) do
    %__MODULE__{
      uuid: uuid,
      text: text
    }
  end
end
