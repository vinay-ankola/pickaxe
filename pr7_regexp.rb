str = "cat and dog"

if str =~ /cat/
	puts "There's a cat in here somewhere"
end

puts str =~ /dog/ # this returns the character offset at which the match occured

puts "*********"

File.foreach("testfile.txt").with_index do |line, index|
	puts "#{index}: #{line}" if line =~ /on/
end

puts "*********"

File.foreach("testfile.txt").with_index do |line, index|
	puts "#{index}: #{line}" if line !~ /on/
end

puts "*********"

# Changing strings with patterns
str = "Dog and Cat"
puts "Let's go to the #{str} for a pint"
new_str = str.sub(/Cat/, "Gerbil")
puts "Let's go to the #{new_str} for a pint"

puts "*********"

# gsub
str = "Dog and Cat"
new_str1 = str.sub(/a/, "*")
new_str2 = str.gsub(/a/, "*")

puts "Using sub: #{new_str1}"
puts "Using str: #{str}"
puts "Using gsub: #{new_str2}"

puts "*********"

# To modify the original string, use sub! and gsub!

str = "now is the time"
puts str

str.sub!(/i/, "*")
str.gsub!(/t/, "T")
puts str

puts "*********"

str = "Vinay Ankola"
ptr = /ay/
puts ptr.match(str)
puts ptr.match(str).pre_match
puts ptr.match(str).post_match
puts ptr.match(str)[0]