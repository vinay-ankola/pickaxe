def power_proc_generator 
	value = 1
	puts "Value: #{value}"
	lambda { value += value }
end

power_proc = power_proc_generator
# puts power_proc.call
# puts power_proc.call
# puts power_proc.call
# puts power_proc.call

5.times do
	puts power_proc.call
end