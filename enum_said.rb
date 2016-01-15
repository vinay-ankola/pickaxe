short_enum = [1, 2, 3, 4, 5].to_enum
long_enum = ('a'..'z').each

loop do
	puts "#{short_enum.next} - #{long_enum.next}"
end

short_hash = { :dog => 'canine', :fox => 'vulpine'}
p short_hash[:dog]