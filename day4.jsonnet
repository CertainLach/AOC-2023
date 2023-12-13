function(input = |||
	Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
	Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
	Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
	Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
	Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
	Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
|||, part = '2')
local
	ne = function(v) v != '',
	c = [
		std.length(std.filter(function(n) std.member(win, n), have))
		for [win, have] in std.map(function(c) std.map(function(v) std.set(std.filter(ne, std.split(v, ' '))), std.split(std.split(c, ':')[1], '|')), std.filter(ne, std.split(input, '\n')))
	],
	y(cb) = local v = cb(v); v,
	call(f) = f(),
;
if part == '1' then std.sum([
	std.floor(std.foldl(function(acc, _) acc * 2, std.range(1, v), 0.5))
	for v in c
]) else std.sum(std.join([], std.map(call, y(function(out) [
	function() [c[v]] + std.join([], std.map(call, out[v+1:v+c[v]+1]))
	for v in std.range(0, std.length(c) - 1)
])))) + std.length(c)
