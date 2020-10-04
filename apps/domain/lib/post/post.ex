defmodule Amitiville.Domain.Post.Post do
  defstruct [:uuid, :state, :text]

  alias Amitiville.Domain.Post.Commands.{Create, Append, Publish}
  alias Amitiville.Domain.Post.Events.{Created, Updated, Publicated}

  def execute(%__MODULE__{uuid: nil}, %Create{uuid: id, text: text}) do
    %Created{uuid: id, text: text, state: :draft}
  end

  def execute(%__MODULE__{state: :draft, uuid: uuid, text: text}, %Append{text: new_text}) do
    %Updated{
      uuid: uuid,
      text: "#{text}, #{new_text}",
      state: :draft
    }
  end

  def execute(%__MODULE__{state: :draft}, %Publish{uuid: uuid}),
    do: %Publicated{uuid: uuid, state: :public}

  def apply(%__MODULE__{} = aggregate, %Created{
        uuid: id,
        text: text
      }) do
    %__MODULE__{aggregate | uuid: id, text: text, state: :draft}
  end

  def apply(%__MODULE__{} = aggregate, %Updated{
        text: text,
        state: state
      }) do
    %__MODULE__{aggregate | text: text, state: state}
  end

  def apply(%__MODULE__{} = aggregate, %Publicated{
        state: state
      }) do
    %__MODULE__{aggregate | state: state}
  end
end
