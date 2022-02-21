defmodule Scryfall.Set do
  import Scryfall.Request
  import Scryfall.Serializer

  @moduledoc """

  A Set object represents a group of related Magic cards. All Card objects on Scryfall belong to exactly one set.
  Due to Magic’s long and complicated history, Scryfall includes many un-official sets as a way to group promotional or outlier cards together. Such sets will likely have a code that begins with p or t, such as pcel or tori.
  Official sets always have a three-letter set code, such as zen.

  API reference: https://scryfall.com/docs/api/sets
  """

  defstruct [
    :id,
    :object,
    :code,
    :mtgo_code,
    :arena_code,
    :tcgplayer_id,
    :name,
    :uri,
    :scryfall_uri,
    :search_uri,
    :released_at,
    :set_type,
    :card_count,
    :printed_size,
    :digital,
    :nonfoil_only,
    :foil_only,
    :block_code,
    :block,
    :parent_set_code,
    :icon_svg_uri
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          object: String.t(),
          code: String.t(),
          mtgo_code: String.t(),
          arena_code: String.t(),
          tcgplayer_id: integer,
          name: String.t(),
          uri: String.t(),
          scryfall_uri: String.t(),
          search_uri: String.t(),
          released_at: String.t(),
          set_type: String.t(),
          card_count: integer,
          printed_size: integer,
          digital: boolean,
          nonfoil_only: boolean,
          foil_only: boolean,
          block_code: String.t(),
          block: String.t(),
          icon_svg_uri: String.t(),
          parent_set_code: String.t()
        }

  @base_url "https://api.scryfall.com/sets"

  @spec list :: Scryfall.List.t(t)
  def list do
    do_request(@base_url) |> from_json(to: %__MODULE__{})
  end

  @spec get_by(id: String.t(), code: String.t()) :: t
  def get_by(id: id), do: do_request(@base_url <> "/#{id}") |> from_json(to: %__MODULE__{})
  def get_by(code: code), do: do_request(@base_url <> "/#{code}") |> from_json(to: %__MODULE__{})
end
