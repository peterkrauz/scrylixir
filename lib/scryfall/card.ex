defmodule Scryfall.Card do
  import Scryfall.Request
  import Scryfall.Serializer

  @moduledoc """

  Card objects represent individual Magic: The Gathering cards that players could obtain
  and add to their collection (with a few minor exceptions).

  Cards are the API’s most complex object. You are encouraged to thoroughly read this document and also the article about layouts and images.

  API reference: https://scryfall.com/docs/api/cards
  """

  defstruct []

  @type t :: %__MODULE__{}

  @base_url "https://api.scryfall.com/cards"

  @spec random :: t()
  def random do
    do_request(@base_url <> "/random") |> from_json(to: %__MODULE__{})
  end
end
