defmodule Day4 do
  @moduledoc """
  Documentation for Day4.
  """

  def valid_passphrase_count(file) do
    File.stream!(file)
      |> Stream.map(&passphrase_valid?/1)
      |> Enum.count(&(&1))
  end

  def valid_anagram_passphrase_count(file) do
    File.stream!(file)
      |> Stream.map(&anagram_passphrase_valid?/1)
      |> Enum.count(&(&1))
  end

  def passphrase_valid?(passphrase) do
    words = String.split(passphrase)
    count = Enum.reduce(words, 0, fn(x, acc) -> acc + Enum.count(words, &(String.equivalent? x, &1)) end)
    count == Enum.count(words)
  end

  def anagram_passphrase_valid?(passphrase) do
    words = String.split(passphrase)
    count = Enum.reduce(words, 0, fn(x, acc) -> acc + Enum.count(words, &(anagrams?(x, &1))) end)
    count == Enum.count(words)
  end

  def anagrams?(a, b) do
    a_cl = String.to_charlist a
    b_cl = String.to_charlist b
    (Enum.sort a_cl) == (Enum.sort b_cl)
  end
end
