Snack = Struct.new(:name, :carbs)

module SnackBar
	SNACKS = [ 
		Snack.new(:Snickers, 20),
		Snack.new(:Popcorn, 15),
		Snack.new(:Nachos, 25),
		Snack.new(:Pretzel, 10),
		Snack.new(:Soda, 5)
	]

	def self.random
		SNACKS.sample
	end
end

if __FILE__ == $0
	puts SnackBar::SNACKS[3]
	puts SnackBar.random.name
end

