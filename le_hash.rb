Snack = Struct.new(:name, :carbs)

module SnackBar
	SNACKS = [
		Snack.new("Starburst", 50),
		Snack.new("Snickers", 25),
		Snack.new("Lollipop", 15),
		Snack.new("Snickers", 35)
	]

	def self.random
		SNACKS.sample
	end
end

def hash_it
	snack = SnackBar.random
	puts "3a: Random snack: #{snack}"
	
	snacks = SnackBar::SNACKS
	snack_bar = Hash.new(0)
	snacks.each do |one_snack|
		snack_bar[one_snack.name] += one_snack.carbs
	end
	puts "3b: Hash: #{snack_bar}"
end

module ModIt
	def self.hash_it_up
		snack = SnackBar.random
		puts "4: Module snack: #{snack}"
	end
end

puts "1: #{SnackBar::SNACKS[1]}"
puts "2: #{SnackBar.random}"
hash_it
ModIt.hash_it_up


