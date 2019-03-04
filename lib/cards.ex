defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of playing cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do 
    values =  ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Valet", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"  
    end
  end

  @doc """
    Suffle a deck
  """
  def shuffle(deck) do 
    Enum.shuffle(deck)
  end


  @doc """
    Determines whether a deck contains a given cards

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
      iex> Cards.contains?(deck, "Eleven of Spades")
      false
  """
  def contains?(deck, card) do 
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples 

      iex> deck =  Cards.create_deck
      iex> { hand, _deck } = Cards.deal(deck, 1)
      iex> hand 
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do 
    Enum.split(deck, hand_size)
  end

  @doc """
    Save a deck into a file named `filename`

  ## Examples 

      iex> Cards.save(Cards.create_deck, "my_deck")
      :ok
  """
  def save(deck, filename) do
    File.write(filename, :erlang.term_to_binary(deck))
  end

  @doc """
    Load a deck from a file previosly saved with Cards.load. 
    If `filename` doesn't exist, it returns an error.

  ## Examples

      iex> Cards.save(["Ace of Spades"], "my_deck")
      iex> Cards.load("my_deck")
      ["Ace of Spades"]
      iex> Cards.load("an_other_deck")
      "File 'an_other_deck' does not exist"
  """
  def load(filename) do 
    case File.read(filename) do 
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "File '#{filename}' does not exist"  
      _ -> "something went wrong"
    end 
  end

  @doc """
    Creates a deck, suffles it and deals a hand of cards 
  """
  def create_hand(hand_size) do 
    Cards.create_deck 
    |> Cards.shuffle 
    |> Cards.deal(hand_size)
  end

end
