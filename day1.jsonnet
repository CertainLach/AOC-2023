function (input = |||
	1abc2
	pqr3stu8vwx
	a1b2c3d4e5f
	treb7uchet
|||, part = '2')
local
	{find, split, length, sum, map, parseInt, regexFullMatch, stripChars, ...} = std,
	nums = 'one|two|three|four|five|six|seven|eight|nine',
	numregex = if part == '1' then @'\d' else @'(\d|%s)' % nums,
	ni(v) = local f = find(v, split(nums, '|')); if length(f) == 0 then v else f[0]+1+''
;
sum(map(function(line) parseInt(ni(regexFullMatch(@'.*?%s.*'%numregex, line).captures[0])+ni(regexFullMatch(@'.*%s.*?' % numregex, line).captures[0])),split(stripChars(input, '\n'), '\n')))
