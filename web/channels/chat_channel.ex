defmodule ElixirWebsocket.ChatChannel do
  use Phoenix.Channel

  #def join("chats:" <> _some_food_string, _message, socket) do
  def join("*", _message, socket) do
    {:ok, socket}
  end

  def leave(_reason, socket) do
    {:ok, socket}
  end

  def handle_in("new:msg", message, socket) do
    broadcast socket, "new:msg", message
  end
end
