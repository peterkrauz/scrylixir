defmodule CardTest do
  use ExUnit.Case, async: true
  doctest Scryfall.Card

  test "get_by(id) returns expected result" do
      card = Scryfall.Card.get_by(id: "e9d5aee0-5963-41db-a22b-cfea40a967a3")
      assert card.name == "Dusk // Dawn"
      assert card.id == "e9d5aee0-5963-41db-a22b-cfea40a967a3"
      assert card.lang == "en"
      assert card.layout == "split"
      assert card.colors == ["W"]
      assert card.card_faces == [
        %{
          "object" => "card_face",
          "name" =>"Dusk",
          "artist" => "Noah Bradley",
          "artist_id" => "81995d11-da98-4f8b-89bd-b88ca2ddb06b",
          "illustration_id" => "f3d63aed-2784-4ef5-9676-846b1e65e040",
          "mana_cost" => "{2}{W}{W}",
          "oracle_text" => "Destroy all creatures with power 3 or greater.",
          "type_line" => "Sorcery"
        },
        %{
          "object" => "card_face",
          "name" =>"Dawn",
          "artist" => "Noah Bradley",
          "artist_id" => "81995d11-da98-4f8b-89bd-b88ca2ddb06b",
          "flavor_name" => "",
          "mana_cost" => "{3}{W}{W}",
          "oracle_text" => "Aftermath (Cast this spell only from your graveyard. Then exile it.)\nReturn all creature cards with power 2 or less from your graveyard to your hand.",
          "type_line" => "Sorcery"
        }
      ]
  end
end
