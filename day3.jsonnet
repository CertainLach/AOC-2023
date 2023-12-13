function (input = |||
	467..114..
	...*......
	..35..633.
	......#...
	617*......
	.....+.58.
	..592.....
	......755.
	...$.*....
	.664.598..
|||, part = '2')
local
	{filter, map, foldl, split, length, range, regexFullMatch, any
	, regexGlobalReplace, join, sum, parseInt, set, flattenArrays, ...} = std,
	ne(v) = v != "",
	schema = [[
		i
	for i in filter(ne, split(r, ''))] for r in filter(ne, split(input, '\n'))],
	w = length(schema[0]), h = length(schema),
	xr = range(0, w - 1), yr = range(0, h - 1),
	rpm(v) = range(v - 1, v + 1),
	g(x, y, t = schema) = if y >= h || y < 0 || x >= w || x < 0 then '.' else t[y][x],
	c(x, y, r, t = schema) = regexFullMatch(r, g(x, y)) != null,
	prop(bless) =
		local propagated = [[
			c(x, y, @'\d') && any([
				g(xc, y, bless) == true
				for xc in rpm(x)
			])
			for x in xr] for y in yr
		];
		if propagated != bless then prop(propagated) else propagated,
	bless = prop([[
		c(x, y, @'\d') && any([
			c(xc, yc, @'[^\d\.]')
			for xc in rpm(x) for yc in rpm(y)
		])
		for x in xr] for y in yr
	]),
	first(x, y) = if c(x - 1, y, @'\d') then first(x - 1, y) else [x, y],
	num([x, y]) =
		local aux(x, y) = g(x, y) + (if c(x + 1, y, @'\d') then aux(x + 1, y) else '');
		parseInt(aux(x, y))
;
if part == '1' then sum(flattenArrays([
	map(parseInt, filter(ne, split(regexGlobalReplace(join('', [
		if bless[y][x] then g(x, y) else '.'
		for x in xr
	]), @'\.+', ' '), ' ')))
	for y in yr
])) else sum(map(function(coords) foldl(function(a, b) a * b, map(num, coords), 1), filter(function(v) length(v) == 2, flattenArrays([
	[
		set([first(xc, yc) for yc in rpm(y) for xc in rpm(x) if c(xc, yc, @'\d')])
		for x in xr if c(x, y, @'\*')
	]
	for y in yr
]))))
