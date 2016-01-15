# 3.times do |number|
# 	puts "#{number}: Let's start mastering Ruby blocks!"
# end

# 3.times { |n| puts "#{n}: Let's start mastering Ruby blocks!" }

# 5.times do |count|
# 	puts "\n#{count} situp"
# 	puts "#{count} pushup"
# 	puts "#{count} chinup"
# end

# 1.upto(5) do |count|
# 	puts "\n#{count} situp"
# 	puts "#{count} pushup"
# 	puts "#{count} chinup"
# end

1.step(9, 2) do |count|
	puts "\n#{count} situp"
	puts "#{count} pushup"
	puts "#{count} chinup"
end