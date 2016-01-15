require 'mathn'

file = File.open("poem.txt")
file.each do |line|
	puts line
end

puts

dir = Dir.new(".")
dir.each { |entry| puts entry }

Prime.each { |number| puts number }