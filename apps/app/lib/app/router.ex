defmodule Amitiville.App.Router do
  use Commanded.Commands.Router

  alias Amitiville.Domain.Post.Commands.{Create, Append, Publish}
  alias Amitiville.Domain.Post.Post

  identify(Post, by: :uuid)

  dispatch([Create, Append, Publish], to: Post)
end
