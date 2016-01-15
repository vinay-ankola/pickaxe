def show_regexp(string, pattern)
	match = pattern.match(string)
	if match
		puts "#{match.pre_match} -> #{match[0]} <- #{match.post_match}"
	else
		puts "no match"
	end
end

show_regexp('very interesting', /t/)
show_regexp('Fats Waller', /lle/)
show_regexp('Fats Waller', /z/)
show_regexp('yes | no', /\|/)
show_regexp('yes (no)', /\(no\)/)
show_regexp('are you sure?', /e\?/)

str = "this is\nthe time"
show_regexp(str, /^the/)
show_regexp(str, /is$/)
show_regexp(str, /\Athis/)
show_regexp(str, /\Athe/)