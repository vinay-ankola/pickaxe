def twice
		puts "Before yield"
		yield
		yield
		puts "After yield"
end

twice { puts "Running your program" }

puts "***** 2 *******"

def three_times
		puts "Ready"
		yield(1)
		puts "Set"
		yield 2
		puts "Go"
		yield 3
end

three_times { |number| puts number * number }

puts "****** 3 ******"

def compute
	puts yield
end

compute do
	"Hello"
	7
	3.14 # the last expression evaluated inside the block
end

puts "****** 4 ******"

def compute
	if block_given?
		puts yield
	else
		puts "Does not compute!"
	end
end

compute
compute { 3.14 }

puts "****** 5 ******"

numbers = (1..10).to_a
puts numbers.select { |n| n.even? }

def my_select(array)
	results = []
	array.each do |element|
		results << element if yield(element)
	end
	results
end

my_select(numbers) { |n| n.even? }