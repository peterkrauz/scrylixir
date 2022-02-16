defmodule Scryfall.Serializer do
  import Map
  @moduledoc """
  TODO
  """

  @spec from_json(map, struct) :: Scryfall.List.t(struct)
  def from_json(raw_content, start) do
    %Scryfall.List{
      object: get(raw_content, "object"),
      has_more: get(raw_content, "has_more"),
      next_page: get(raw_content, "next_page"),
      data: get(raw_content, "data") |> serialize_data(start),
    }
  end

  @spec serialize_data(list, struct) :: list
  def serialize_data(raw_content, base_struct) do
    raw_content
    |> Enum.map(fn raw_data -> build_obj(raw_data, base_struct) end)
  end

  @spec build_obj(map, struct) :: struct
  defp build_obj(raw_map, base_struct) do
    Enum.zip(keys(raw_map), values(raw_map))
    |> Enum.reduce(base_struct, &attach_field/2)
  end

  @spec attach_field(tuple, struct) :: struct
  defp attach_field({field, value}, base_struct), do: %{base_struct | String.to_atom(field) => value}

end
