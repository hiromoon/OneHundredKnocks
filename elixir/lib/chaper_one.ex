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

  defp pick_word(list, range) do
    Enum.map(range, fn(x) -> {head, _} = List.pop_at(list, x); head end)
  end

  def ngram_word(len, str) do
    words = str |> parseToWord
    ranges = Enum.map(0..(length(words)-1), fn(x) -> x..(x + len - 1) end)
    Enum.map(ranges, fn(x) -> pick_word(words, x) end)
    |> Enum.drop(-1)
  end

  def ngram_char(len, str) do
    ranges = Enum.map(0..(String.length(str)-1), fn(x) -> x..(x + len - 1) end)
    Enum.map(ranges, fn(x) -> String.slice(str, x) end)
    |> Enum.drop(-1)
    |> Enum.uniq
  end

  def set_sum(x, y) do
    x++y |> Enum.uniq |> Enum.sort
  end

  def set_mul(x, y) do 
    Enum.reduce(x, [], fn (e, acc) ->
      case Enum.member?(y, e) do
        true -> [e | acc]
        false -> acc
      end
    end)
    |> Enum.sort
  end

  def set_sub(x, y) do
    x--y |> Enum.uniq |> Enum.sort
  end

  def check_se(set) do
    Enum.member?(set, "se")
  end
end
