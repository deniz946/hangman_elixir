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

  test "when game is won state doesnt change" do
    game = Game.new_game("word")
    game = Map.put(game, :game_state, :won)

    {new_game, _tully} = Game.make_move(game, "x")
    assert new_game == game

  end

  test "states duplicate" do
    game = Game.new_game("word")
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state != :already_used
    {game, _tally} = Game.make_move(game, "y")
    assert game.game_state != :already_used
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state == :already_used

  end
end
