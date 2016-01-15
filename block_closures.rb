# blocks can be closures

def n_times(thing)
	puts thing
	lambda { |n| thing * n }
end

p1 = n_times(23)
result = p1.call(3)
puts result

p2 = n_times("Hello")
result2 = p2.call(4)
puts result2


