#"""
#5 Friends (let's call them a, b, c, d and e) 
#are playing a game and need to keep track of the scores.
#Each time someone scores a point, the letter of his name is typed in lowercase.
#If someone loses a point, the letter of his name is typed in uppercase.
#Give the resulting score from highest to lowest.
#Input Description
#A series of characters indicating who scored a point. Examples:
#abcde
#dbbaCEDbdAacCEAadcB
#Output Description
#The score of every player, sorted from highest to lowest. Examples:
#a:1, b:1, c:1, d:1, e:1
#b:2, d:2, a:1, c:0, e:-2

#Challenge Input
#EbAAdbBEaBaaBBdAccbeebaec
#"""

input = 'EbAAdbBEaBaaBBdAccbeebaec'
result_key='abcde'

count_map = Enum.reduce(input, %{}, fn(x, map) ->
  Map.update(map, x, 1, &(&1 + 1))
end)

count_map = Enum.reduce(result_key, count_map, fn(x, map) ->
  win = Map.get(map, x, 0)
  lose = Map.get(map, x-(?a-?A), 0)
  Map.put(map, x, win-lose)
end)

count_map |> Map.take(result_key)
  |> Enum.sort(fn({_, y1}, {_, y2}) -> y1>=y2 end)
  |> Enum.map(fn({x, y}) -> [<<x>> <> ":" <> to_string(y)] end)
  |> Enum.join(",")
  |> IO.puts
