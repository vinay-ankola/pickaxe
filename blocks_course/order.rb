class Order

	TAX_TABLE = { "CO" => 0.02, "MT" => 0.00, "AZ" => 0.04 }

	attr_reader :email, :state, :total, :status 

	def initialize(email, state, total, status=:pending)
		@email = email
		@state = state		
		@total = total
		@status = status
	end

	def tax
		total * TAX_TABLE[state]
	end

	def to_s
		"#{email} (#{state}): $#{total} - #{status}"
	end
end

orders = []
orders << Order.new("customer1@example.com", "MT", 300)
orders << Order.new("customer2@example.com", "AZ", 400, :completed)
orders << Order.new("customer3@example.com", "CO", 200)
orders << Order.new("customer4@example.com", "CO", 100, :completed)

puts orders

puts "\nBig orders:"
puts orders.select { |o| o.total >= 300 }

puts "\nSmall orders:"
puts orders.reject { |o| o.total >= 300 }

puts orders.any? { |o| o.status == :pending }

puts orders.detect { |o| o.status == :pending }

pending_orders, completed_orders = orders.partition { |o| o.status == :pending }

puts "\nPending orders:"
puts pending_orders

puts "\nCompleted orders:"
puts completed_orders

big_orders, small_orders = orders.partition { |o| o.total >= 300 }

puts "\nBig orders:"
puts big_orders

puts "\nSmall orders:"
puts small_orders

puts "\nNewsletter emails:"

emails = []
orders.each { |o| emails << o.email.downcase }
p emails

emails = orders.map { |o| o.email.downcase }
p emails

puts "\nTaxes:"
co_taxes = orders.select { |o| o.state == "CO" }.map { |o| o.tax }
p co_taxes

sum = orders.reduce(0) { |sum, order| sum + order.total }
puts "\nTotal sales: $#{sum}"

#total_tax = orders.reduce(0) { |total, order| total + order.tax }
total_tax = orders.map { |order| order.tax }.reduce(:+)
puts "\nTotal tax: $#{total_tax}"

# orders = []
# 1.upto(5) do |n|
# 	orders << Order.new("customer#{n}@msn.com", n * 10)
# end

# puts "\nAll Orders:"
# puts orders

# puts "\nNewsletter emails:"

# orders.each do |order|
# 	puts order.email
# end

# sum = 0
# orders.each do |order|
# 	sum += order.total
# end
# puts "\nTotal sales: $#{sum}"

# taxes = { "CO" => 0.02, "MT" => 0.00, "AZ" => 0.04 }
# taxes.each do |key, value|
# 	puts "#{key}: #{value * 100}%"
# end