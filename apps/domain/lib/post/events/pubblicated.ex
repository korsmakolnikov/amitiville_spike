defmodule Amitiville.Domain.Post.Events.Publicated do
  @derive [Jason.Encoder]
  defstruct [:uuid, :state]
end
