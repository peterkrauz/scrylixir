defmodule Scryfall.Request do
  @moduledoc """

  Boilerplate functions to offer help to other module's http calls.
  """

  @spec do_request(String.t()) :: map()
  def do_request(url) do
    HTTPoison.get!(url)
    |> Map.get(:body)
    |> Poison.decode!
  end

end
