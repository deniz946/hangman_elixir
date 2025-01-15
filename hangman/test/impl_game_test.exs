defmodule HangmanImplGameTest do
  use ExUnit.Case
  alias Hangman.Impl.Game

  test "new game returns structure" do
    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "new game returns structure given a word" do
    game = Game.new_game("word")

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) == 4
  end

  test "every char is between a and z" do
    game = Game.new_game

    game.letters
    |> Enum.all?(fn l -> String.match?(l, ~r/[a-z]/) end)
    |> assert

  end
end
