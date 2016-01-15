class Canine
	attr_accessor :name, :breed, :age

	def initialize
		@name = "Snoopy"
		@breed = "unknown"
		yield self if block_given?
	end
end

dog = Canine.new do |c|
	c.name = "Buddy"
	c.breed = "Golden Retriever"
	c.age = 4
end

p dog