defmodule GraphqlExample.PostResolver do

  alias GraphqlExample.Repo
  alias GraphqlExample.Post

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Post, id) do
      nil ->
        {:error, "Post id #{id} not found"}
      post ->
        {:ok, post}
    end
  end
end
