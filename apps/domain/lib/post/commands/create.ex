defmodule Amitiville.Domain.Post.Commands.Create do
  @enforce_keys [:uuid, :text]
  defstruct [:uuid, :text]

  def build(text) do
    %__MODULE__{
      uuid: UUID.uuid4(),
      text: text
    }
  end
end
