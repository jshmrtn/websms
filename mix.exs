defmodule Websms.MixProject do
  @moduledoc false

  use Mix.Project

  @version "1.0.0-alpha.1"

  def project do
    [
      app: :websms,
      version: @version,
      elixir: "~> 1.11",
      build_embedded:
        Mix.env() == :prod or System.get_env("BUILD_EMBEDDED", "false") in ["1", "true"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      dialyzer:
        if (System.get_env("DIALYZER_PLT_PRIV") || "false") in ["1", "true"] do
          [plt_file: {:no_warn, "priv/plts/dialyzer.plt"}]
        else
          []
        end
    ]
  end

  defp description do
    """
    websms.ch client
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:openapi_compiler, "~> 1.0-beta"},
      {:mint, "~> 1.0"},
      {:castore, "~> 0.1"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:excoveralls, "~> 0.5", only: [:test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:credo, "~> 1.0", only: [:dev], runtime: false}
    ]
  end

  defp package do
    # These are the default files included in the package
    [
      name: :websms,
      files: ["lib", "mix.exs", "README*", "LICENSE*", "priv/schema.yaml"],
      maintainers: ["Jonatan Männchen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jshmrtn/websms"}
    ]
  end

  defp docs do
    [
      source_ref: "v" <> @version,
      source_url: "https://github.com/jshmrtn/websms"
    ]
  end
end
