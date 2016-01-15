# class Snack
# 	attr_reader :name, :carbs

# 	def initialize(name, carbs)
# 		@name = name
# 		@carbs = carbs
# 	end
# end

Snack = Struct.new(:name, :carbs)

module SnackBar
	SNACKS = [
		Snack.new(:popcorn, 20),
		Snack.new(:candy, 15),
		Snack.new(:nachos, 40),
		Snack.new(:pretzels, 10),
		Snack.new(:soda, 5)
	]

	def self.random
		SNACKS.sample
	end
end

if __FILE__ == $0
	puts SnackBar::SNACKS[1]
	snack = SnackBar.random
	puts snack.class
	puts snack
	puts "Enjoy your #{snack.name} (#{snack.carbs})"
end

# popcorn = Snack.new('popcorn', 20)
# puts popcorn.name
# puts popcorn.carbs

# candy = Snack.new('candy', 15)
# puts candy.name
# puts candy.carbs