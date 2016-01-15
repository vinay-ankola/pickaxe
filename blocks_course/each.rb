# Each iterator method for Arrays

weekdays = ["monday", "tuesday", "wednesday", "thursday", "friday"]
weekdays.each { |d| puts d.capitalize }

puts "..."

file = File.open("poem.txt")
file.each { |line| puts line }

dir = Dir.new("C:\\pickaxe\\blocks_course")
dir.each { |entry| puts entry }
