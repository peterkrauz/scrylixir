defmodule Scryfall.Resource do
  @moduledoc """
  TODO
  """

  defmacro __using__(_args) do
    quote do
      import Scryfall.Request
      import Scryfall.Serializer

      @spec fetch_resource(url: String.t(), to: struct) :: list | struct
      defp fetch_resource(url: url, to: module) do
        do_request(url) |> from_json(to: module)
      end
    end
  end
end
