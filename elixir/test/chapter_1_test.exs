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
end
