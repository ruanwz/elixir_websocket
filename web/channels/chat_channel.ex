defmodule ElixirWebsocket.ChatChannel do
  use Phoenix.Channel

  def join("chats:"<> _some_chat_string, _message, socket) do
    {:ok, socket}
  end

  def leave(_reason, socket) do
    {:ok, socket}
  end

  def handle_in("new:msg", message, socket) do
    broadcast socket, "new:msg", message
  end
  def handle_in("ping", message, socket) do
    broadcast socket, "ping", message
  end

  def handle_in("pong", message, socket) do
    broadcast socket, "pong", message
  end
end
