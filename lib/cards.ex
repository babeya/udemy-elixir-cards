defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  def create_deck do 
    values =  ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Valet", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"  
    end
  end

  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do 
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do 
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    File.write(filename, :erlang.term_to_binary(deck))
  end

  def load(filename) do 
    case File.read(filename) do 
    {:ok, binary} -> :erlang.binary_to_term(binary)
    {:error, _} -> "File '#{filename}' does not exist"  
    _ -> "something went wrong"
    end 
  end 

end
