defmodule Scryfall.Serializer do
  @moduledoc """
  TODO
  """

  @spec from_list(map, (any -> struct)) :: Scryfall.List.t(struct)
  def from_list(raw_content, map_fn) do
    %Scryfall.List{
      object: Map.get(raw_content, "object"),
      has_more: Map.get(raw_content, "has_more"),
      next_page: Map.get(raw_content, "next_page"),
      data: Map.get(raw_content, "data") |> Enum.map(map_fn),
    }
  end

end
