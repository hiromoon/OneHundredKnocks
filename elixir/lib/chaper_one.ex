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

  defp parseToWord(str) do
    Regex.replace(~r/[\.,]/, str, "")
    |> String.split
  end

  def pi(str) do
    str
    |> parseToWord
    |> Enum.map(&String.length/1)
  end

  defp toShortKey(map) do
    Enum.reduce(map, %{},
                fn ({key, val}, acc) ->
                  case val do
                    1 -> Map.put(acc, String.first(key), val)
                    5 -> Map.put(acc, String.first(key), val)
                    6 -> Map.put(acc, String.first(key), val)
                    7 -> Map.put(acc, String.first(key), val)
                    8 -> Map.put(acc, String.first(key), val)
                    9 -> Map.put(acc, String.first(key), val)
                    15 -> Map.put(acc, String.first(key), val)
                    16 -> Map.put(acc, String.first(key), val)
                    19 -> Map.put(acc, String.first(key), val)
                    _ -> Map.put(acc, String.slice(key, 0..1), val)
                  end
                end)
  end

  defp listToMap(list) do
    Enum.zip(1..length(list), list)
    |> List.foldl(%{}, fn({index, key}, acc) -> Map.put(acc, key, index) end)
  end

  def elements(str) do
    str
    |> parseToWord
    |> listToMap
    |> toShortKey
  end
end
