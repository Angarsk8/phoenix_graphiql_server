defmodule GraphqlExample.Router do
  use GraphqlExample.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GraphqlExample do
    pipe_through :api
  end

  forward "/api", Absinthe.Plug, schema: GraphqlExample.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: GraphqlExample.Schema
end
