defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do 
    assert length(Cards.create_deck) == 52
  end

  test "suffling  a deck randomizes it" do 
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end

end
