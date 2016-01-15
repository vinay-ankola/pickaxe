class BookInStock
	# attr_reader :isbn, :price
	# attr_accessor :price - this method provides both a reader plus a writer for a given attribute
	
	def initialize(isbn, price)
		@isbn = isbn
		@price = Float(price)
	end
	
	def isbn
		@isbn
	end
	
	def price
		@price
	end
	
	def price=(new_price)
		@price = new_price
	end
	
	def price_in_cents
		Integer(price * 100 + 0.5)
	end
	
	def price_in_cents1=(cents)
		@price = cents / 100.0
	end
	def to_s
		"ISBN: #{@isbn}, PRICE: #{@price}"
	end	
end

booky = BookInStock.new("ISBN123534", 33.80)
#puts "ISBN: #{booky.isbn}"
puts "Price: #{booky.price}\n\n"

#booky.price = booky.price * 0.75
#puts "New Price #{booky.price}"
#puts "ISBN: #{booky.isbn}, Price: #{booky.price}"

puts "Price in cents: #{booky.price_in_cents}"
booky.price_in_cents1 = 1234
puts "Price: #{booky.price}"
puts "Price in cents: #{booky.price_in_cents}\n\n"
