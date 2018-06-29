## --------------------------------
# D&D
# Input "NdM" "roll N M-sided dice"
# Output sum of all dice rolls
## --------------------------------

challenge = """
5d12
6d4
1d2
1d8
3d6
4d20
100d100
"""

challenge
|> String.split("\n", trim: true)
|> Enum.each(fn dice ->
    [n, m] = String.split(dice, "d") |> Enum.map(fn x -> String.to_integer(x) end)
    rolls = for _ <- 1..n, do: Enum.random(1..m)
    sum = Enum.sum(rolls)
    dices = Enum.join(rolls, ",")
    IO.puts("#{sum}: #{dices}")
end)
