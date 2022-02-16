defmodule Scryfall.Set do
  import Map
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
    icon_svg_uri: String.t()
  }

  @base_url "https://api.scryfall.com/sets"

  @spec list() :: Scryfall.List.t(t) | Scryfall.Error.t()
  def list() do
    do_request(@base_url) |> from_list(&map_to_set/1)
  end

  @spec map_to_set(any) :: t
  def map_to_set(raw_map) do
    Enum.zip(keys(raw_map), values(raw_map))
    |> Enum.reduce(%__MODULE__{}, &attach_field/2)
  end

  @spec attach_field(tuple, t) :: t
  defp attach_field({"parent_set_code", _}, instance), do: instance
  defp attach_field({field, value}, instance), do: %{instance | String.to_atom(field) => value}

end
