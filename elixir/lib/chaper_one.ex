defmodule ChapterOne do

  def reverse(str) do
    String.reverse(str)
  end

  def split(str) do 
    str
    |> String.split("")
    |> pick
    |> Enum.join
  end

  defp pick([a, _, b, _, c, _, d, _, _]) do
    [a, b, c, d]
  end

  def join(str1, str2) do
    String.split(str1, "")
    |> Enum.zip(String.split(str2, ""))
    |> Enum.map(&Tuple.to_list/1)
    |> List.flatten
    |> Enum.join
  end

  def pi(str) do
    Regex.replace(~r/[\.,]/, str, "")
    |> String.split
    |> Enum.map(&String.length/1)
  end
end
