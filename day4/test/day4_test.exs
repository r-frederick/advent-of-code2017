defmodule Day4Test do
  use ExUnit.Case
  doctest Day4

  test "passphrase checking 'aa bb cc dd ee' returns true" do
    assert Day4.passphrase_valid?("aa bb cc dd ee") == true
  end

  test "passphrase checking 'aa bb cc dd aa' returns false" do
    assert Day4.passphrase_valid?("aa bb cc dd aa") == false
  end

  test "passphrase checking 'aa bb cc dd aaa' returns true" do
    assert Day4.passphrase_valid?("aa bb cc dd aaa") == true
  end

  test "anagram passphrase checking 'abcde fghij' returns true" do
    assert Day4.anagram_passphrase_valid?("abcde fghij") == true
  end

  test "anagram passphrase checking 'abcde xyz ecdab' returns false" do
    assert Day4.anagram_passphrase_valid?("abcde xyz ecdab") == false
  end

  test "anagram passphrase checking 'a ab abc abd abf abj' returns true" do
    assert Day4.anagram_passphrase_valid?("a ab abc abd abf abj") == true
  end

  test "anagram passphrase checking 'iiii oiii ooii oooi oooo' returns true" do
    assert Day4.anagram_passphrase_valid?("iiii oiii ooii oooi oooo") == true
  end

  test "anagram passphrase checking 'oiii ioii iioi iiio' returns false" do
    assert Day4.anagram_passphrase_valid?("oiii ioii iioi iiio") == false
  end
end
