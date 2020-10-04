defmodule Amitiville.Domain.Post.Events.Created do
  @derive [Jason.Encoder]
  defstruct [:uuid, :text, :state]
end
