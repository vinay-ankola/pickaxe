def get_block(get_num)
	number = get_num
	1.upto(number) do |some_num|
		yield some_num
	end
end

get_block(5) { |num| puts "#{num}: I'm in the block" }