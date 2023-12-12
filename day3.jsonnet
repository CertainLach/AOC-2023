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
	ne(v) = v != "",
	map = [[
		i
	for i in std.filter(ne, std.split(r, ''))] for r in std.filter(ne, std.split(input, '\n'))],
	w = std.length(map[0]), h = std.length(map),
	xr = std.range(0, w - 1), yr = std.range(0, h - 1),
	rpm(v) = std.range(v - 1, v + 1),
	g(x, y, t = map) = if y >= h || y < 0 || x >= w || x < 0 then '.' else t[y][x],
	c(x, y, r, t = map) = std.regexFullMatch(r, g(x, y)) != null,
	prop(bless) =
		local propagated = [[
			c(x, y, @'\d') && std.any([
				g(xc, y, bless) == true
				for xc in rpm(x)
			])
			for x in xr] for y in yr
		];
		if propagated != bless then prop(propagated) else propagated,
	bless = prop([[
		c(x, y, @'\d') && std.any([
			c(xc, yc, @'[^\d\.]')
			for xc in rpm(x) for yc in rpm(y)
		])
		for x in xr] for y in yr
	]),
	first(x, y) = if c(x - 1, y, @'\d') then first(x - 1, y) else [x, y],
	num(x, y) = g(x, y) + (if c(x + 1, y, @'\d') then num(x + 1, y) else '')
;
if part == '1' then std.sum([
	std.sum(std.map(std.parseInt, std.filter(ne, std.split(std.regexGlobalReplace(std.join('', [
		if bless[y][x] then g(x, y) else '.'
		for x in xr
	]), @'\.+', ' '), ' '))))
	for y in yr
]) else std.sum(std.map(function(coords) std.foldl(function(a, b) a * b, std.map(function([x, y]) std.parseInt(num(x, y)), coords), 1), std.filter(function(v) std.length(v) == 2, std.join([], [[
	if c(x, y, @'\*') then std.set(std.filter(ne, [
		if c(xc, yc, @'\d') then first(xc, yc) else ''
		for yc in rpm(y)
		for xc in rpm(x)
	])) else []
	for x in xr] for y in yr
]))))
