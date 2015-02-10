defmodule ElixirWebsocket.Router do
  alias ElixirWebsocket.ChatChannel
  use Phoenix.Router

  socket "/ws" do
    #channel "chats:*", ChatChannel
    channel "chats:*", ChatChannel
  end

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", ElixirWebsocket do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirWebsocket do
  #   pipe_through :api
  # end
end
