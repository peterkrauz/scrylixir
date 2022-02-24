defmodule Scryfall.Resource do
  @moduledoc """
  Keeping it DRY.
  """

  defmacro __using__(_args) do
    quote do
      import Scryfall.Request
      import Scryfall.Serializer

      @spec fetch_resource(url: String.t, to: struct) :: struct
      defp fetch_resource(url: url, to: module) do
        do_request(url) |> from_json(to: module)
      end
    end
  end
end
