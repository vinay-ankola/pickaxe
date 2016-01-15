class Order
	attr_reader :email, :total

	def initialize(email, total)
		@email = email
		@total = total
	end

	def to_s
		"#{@email}: $#{@total}"
	end
end

orders = []

1.upto(3) do |number|
	orders << Order.new("cust#{number}@msn.com", number * 10)
end

puts orders[1]

orders.each do |order|
	puts order.email
end