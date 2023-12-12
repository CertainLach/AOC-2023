function (input = |||
	1abc2
	pqr3stu8vwx
	a1b2c3d4e5f
	treb7uchet
|||, part = '2')
local
	nums = 'one|two|three|four|five|six|seven|eight|nine',
	numregex = if part == '1' then @'\d' else @'(\d|%s)' % nums,
	ni(v) = local f = std.find(v, std.split(nums, '|')); if std.length(f) == 0 then v else f[0]+1+''
;
std.sum(std.map(function(line) std.parseInt(ni(std.regexFullMatch(@'.*?%s.*'%numregex, line).captures[0])+ni(std.regexFullMatch(@'.*%s.*?' % numregex, line).captures[0])),std.split(std.stripChars(input, '\n'), '\n')))
