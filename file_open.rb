f = File.open("testfile.txt")
f.each do |line|
	puts "The line is: #{line}"
end
f.close

g = File.open("testfile.txt")
g.each_with_index do |line, index|
	puts "Line #{index+1} is: #{line}"
end
g.close