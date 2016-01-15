def get_calc
	my_array = (1..12).to_a
	my_array.each do |n|
		yield n.to_i
	end
end

loop do
	puts "Enter a multiplication table number or quit to exit"
	my_table = gets.chomp.downcase

	if my_table == "quit"
		break
	else
		my_table = my_table.to_i
		get_calc { |n| puts "#{my_table} x #{n} = #{my_table * n}" }
	end
end