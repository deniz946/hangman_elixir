defmodule Dictionary do
  def hello do
    :world
  end

  def word_list do
    "../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  def random_word do
    word_list() |> Enum.random()
  end

  def swapped_tuples({a, b}) do
    {b, a}
  end

  def is_equal(b, b) do
    true
  end

  def is_equal(_, _) do
    false
  end
end
