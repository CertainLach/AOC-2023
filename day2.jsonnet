function (input = |||
	Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
	Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
	Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
	Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
	Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
|||, part = '2')
std.sum(std.map(function(l)
	local
		{namedCaptures:{game,data},...} = std.regexFullMatch(@'Game (?<game>\d+): (?<data>.+)', l),
		g = std.foldl(function(acc, v) {
			[c]: std.max(acc?.[c] ?? 0, v?.[c] ?? 0)
			for c in ['red', 'green', 'blue']
		}, [
			{
				[color]: std.parseInt(num),
				for vv in std.split(v, ',')
				for {namedCaptures:{color,num},...} in [std.regexPartialMatch(@'(?<num>\d+) (?<color>[^,]+)', vv)]
			}
			for v in std.split(data, ';')
		], {})
	; if part == '1' then (if g.red <= 12 && g.green <= 13 && g.blue <= 14 then std.parseInt(game) else 0)
	else g.red * g.green * g.blue
, std.filter(function(v) v != "", std.split(input, '\n'))))

