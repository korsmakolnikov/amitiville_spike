defmodule Amitiville.Domain.Post.Events.Updated do
  @derive [Jason.Encoder]
  defstruct [:uuid, :text, :state]
end
