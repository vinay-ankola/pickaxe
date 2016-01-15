class ExampleHash
	attr_accessor :name, :email

	def initialize(attributes = [])
		@name = attributes["name"]
		@email = attributes["email"]
	end
end

list = ExampleHash.new("name" => "Vinay Ankola", "email" => "vinay.ankola@gmail.com")
puts list.name
puts list.email
