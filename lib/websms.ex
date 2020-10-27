defmodule Websms do
  @moduledoc false

  use OpenAPICompiler, yml_path: Application.app_dir(:websms, "priv/schema.yaml")

  adapter(Tesla.Adapter.Mint)
end
