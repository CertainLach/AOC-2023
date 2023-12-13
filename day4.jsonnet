function(input = |||
	Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
	Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
	Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
	Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
	Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
	Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
|||, part = '2')
local
	{length, filter, member, set, map, split, sum, foldl, floor, range, join, ...} = std,
	ne = function(v) v != '',
	c = [
		length(filter(function(n) member(v[0], n), v[1]))
		for v in map(function(c) map(function(v) set(filter(ne, split(v, ' '))), split(split(c, ':')[1], '|')), filter(ne, split(input, '\n')))
	],
	y(cb) = local v = cb(v); v,
	call(f) = f()
;
if part == '1' then sum([
	floor(foldl(function(acc, _) acc * 2, range(1, v), 0.5))
	for v in c
]) else sum(join([], y(function(out) [
	[c[v]] + join([], out[v+1:v+c[v]+1])
	for v in range(0, length(c) - 1)
]))) + length(c)
