def shuffle_string(str)
	print str.split('')
	puts
	print str.split('').shuffle
	puts
	print str.split('').shuffle.join
end

shuffle_string("foobar")