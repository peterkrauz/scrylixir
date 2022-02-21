defmodule Scryfall.Serializer do
  import Map, only: [keys: 1, values: 1]

  @moduledoc """
  The Serializer does convenient, repetitive work related to
  struct-building used by other API modules.
  """

  @spec from_json(map, to: struct) :: struct
  def from_json(%{"object" => object, "has_more" => has_more, "data" => data}, to: base_struct) do
    %Scryfall.List{
      object: object,
      has_more: has_more,
      next_page: nil,
      data: data |> Enum.map(fn raw_data -> build_obj(raw_data, base_struct) end)
    }
  end

  def from_json(raw_map, to: base_struct), do: build_obj(raw_map, base_struct)

  @spec build_obj(map, struct) :: struct
  defp build_obj(raw_map, base_struct) do
    Enum.zip(keys(raw_map), values(raw_map))
    |> Enum.reduce(base_struct, &attach_field/2)
  end

  @spec attach_field(tuple, struct) :: struct
  defp attach_field({field, value}, base_struct) do
    %{base_struct | String.to_atom(field) => value}
  end
end
