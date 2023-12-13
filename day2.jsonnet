function (input = |||
	Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
	Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
	Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
	Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
	Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
|||, part = '2')
local {sum, map, filter, regexFullMatch, regexPartialMatch, foldl, max, parseInt, split, ...} = std;
sum(map(function(l)
	local
		{namedCaptures:{game,data},...} = regexFullMatch(@'Game (?<game>\d+): (?<data>.+)', l),
		g = foldl(function(acc, v) {
			[c]: max(acc?.[c] ?? 0, v?.[c] ?? 0)
			for c in ['red', 'green', 'blue']
		}, [
			{
				[color]: parseInt(num),
				for vv in std.split(v, ',')
				for {namedCaptures:{color,num},...} in [std.regexPartialMatch(@'(?<num>\d+) (?<color>[^,]+)', vv)]
			}
			for v in split(data, ';')
		], {})
	; if part == '1' then (if g.red <= 12 && g.green <= 13 && g.blue <= 14 then parseInt(game) else 0)
	else g.red * g.green * g.blue
, filter(function(v) v != "", split(input, '\n'))))

