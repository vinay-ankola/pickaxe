class Flyer
	attr_reader :name, :email, :miles_flown
	
	def initialize(name, email, miles_flown)
		@name = name
		@email = email
		@miles_flown = miles_flown
	end

	def to_s
		"#{name} (#{email}): #{miles_flown}"
	end
end

flyers = []
1.upto(5) do |count|
	flyers << Flyer.new("Flyer #{count}", "flyer#{count}@example.com", count * 1000)
end

flyers.each do |flyer|
	puts "#{flyer.name} - #{flyer.miles_flown} miles"
end

total = 0
flyers.each do |flyer|
	total += flyer.miles_flown
end

puts "\nTotal miles flown: #{total}\n\n"

#############

promotions = { "United" => 1.5, "Delta" =>  2.0, "Lufthansa" => 2.5 }

promotions.each do |key, value|
	puts "Earn #{value}x miles by flying #{key}!"
end

#############
puts

flyers.each do |flyer|
	promotions.each do |airline, multiplier|
		puts "#{flyer.name} could earn #{flyer.miles_flown * multiplier} miles by flying #{airline}!"
	end
end

#############
puts

desserts = { "chocolate" => 1.00, "vanilla" => 0.75, "cinnamon" => 1.25 }

desserts.each do |flavor, price|
	puts "$#{price * 2} for a cup of #{flavor}"
end

#############
puts

team = "Broncos" # Broncos gets overwritten

1.upto(4) do |number|
  team = "Bobcats"
  puts "#{number} Hooray #{team}"
end

puts team

#############
puts

team = "Broncos"

1.upto(4) do |number; team|
  team = "Bobcats"
  puts "#{number} Hooray #{team}"
end

puts team



