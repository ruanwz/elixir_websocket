defmodule ElixirWebsocket.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_websocket,
     version: "0.0.1",
     elixir: "~> 1.0.2",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {ElixirWebsocket, []},
     applications: [:phoenix, :cowboy, :logger]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, github: "phoenixframework/phoenix"},
     {:cowboy, "~> 1.0"},
     {:coffee_rotor, "~> 0.2.1"},
     {:rotor, github: "HashNuke/rotor", override: true},
     {:exrm, "~> 0.14.16"}
    ]
  end
end
