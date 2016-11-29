defmodule GraphqlExample.Schema do

  use Absinthe.Schema
  import_types GraphqlExample.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &GraphqlExample.PostResolver.all/2
    end
    field :users, list_of(:user) do
      resolve &GraphqlExample.UserResolver.all/2
    end
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &GraphqlExample.UserResolver.find/2
    end
    field :post, type: :post do
      arg :id, non_null(:id)
      resolve &GraphqlExample.PostResolver.find/2
    end
  end
end
