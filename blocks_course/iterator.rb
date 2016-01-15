def three_times(number)
	1.upto(number) do |count|
		yield count
	end
end

three_times(2) do |number|
	puts "#{number} situp"
	puts "#{number} pushup"
	puts "#{number} chinup"
end