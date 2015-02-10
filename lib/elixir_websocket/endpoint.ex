defmodule ElixirWebsocket.Endpoint do
  use Phoenix.Endpoint, otp_app: :elixir_websocket

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :elixir_websocket,
    only: ~w(css images js favicon.ico robots.txt)

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_elixir_websocket_key",
    signing_salt: "GrfA90PS",
    encryption_salt: "8OjPYFfP"

  plug :router, ElixirWebsocket.Router
end
