defmodule ChapterOneTest do
  use ExUnit.Case

  test "00_reverse" do
    assert ChapterOne.reverse("stressed") == "desserts"
  end

  test "01_split_string" do
    assert ChapterOne.split("bglruaey") == "blue"
  end

  test "02_join_string" do
    assert ChapterOne.join("blue", "gray") == "bglruaey"
  end

  test "03_Pi" do
    assert ChapterOne.pi("Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.") == [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9]
  end

  test "04_elements" do
    target = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
    ans = %{
      "H" => 1,
      "He" => 2,
      "Li" => 3,
      "Be" => 4,
      "B" => 5,
      "C" => 6,
      "N" => 7,
      "O" => 8,
      "F" => 9,
      "Ne" => 10,
      "Na" => 11,
      "Mi" => 12,
      "Al" => 13,
      "Si" => 14,
      "P" => 15,
      "S" => 16,
      "Cl" => 17,
      "Ar" => 18,
      "K" => 19,
      "Ca" => 20
    }
    assert ChapterOne.elements(target) == ans
  end

  test "05_ngram" do
    target = "I am an NLPer"
    ans_word = [["I", "am"], ["am", "an"], ["an", "NLPer"]]
    ans_char = ["I ", " a", "am", "m ", "an", "n ", " N", "NL", "LP", "Pe", "er"]
    assert ChapterOne.ngram_word(2, target) == ans_word
    assert ChapterOne.ngram_char(2, target) == ans_char
  end

  test "06_set" do
    x_ans = ["pa", "ar", "ra", "ap", "ad", "di", "is", "se"]
    y_ans = ["pa", "ar", "ra", "ag", "gr", "ap", "ph"]
    sum_ans = ["ad", "ag", "ap", "ar", "di", "gr", "is", "pa", "ph", "ra", "se"]
    mul_ans = ["ap", "ar", "pa", "ra"]
    sub_ans = ["ad", "di", "is", "se"]

    x = ChapterOne.ngram_char(2, "paraparaparadise")
    y =  ChapterOne.ngram_char(2, "paragraph")

    assert x == x_ans
    assert y == y_ans

    assert ChapterOne.set_sum(x, y) == sum_ans
    assert ChapterOne.set_mul(x, y) == mul_ans
    assert ChapterOne.set_sub(x, y) == sub_ans
    assert ChapterOne.check_se(x) == true
    assert ChapterOne.check_se(y) == false
  end
end
