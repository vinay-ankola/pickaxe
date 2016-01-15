class Flyer
	attr_reader :name, :email, :miles_flown
	attr_accessor :status

	def initialize(name, email, miles_flown, status=:bronze)
		@name = name
		@email = email
		@miles_flown = miles_flown
		@status = status
	end

	def to_s
		"#{name} (#{email}): #{miles_flown} - #{status}"
	end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)
puts "\nFlyers:"
puts flyers

platinum_flyers, coach_flyers = flyers.partition { |flyer| flyer.status == :platinum }
puts "\nPlatinum flyers:"
puts platinum_flyers
puts "\nCoach flyers:"
puts coach_flyers

name_tag = flyers.map { |flyer| "#{flyer.name} (#{flyer.status.upcase})"}
puts "\nName tags:"
puts name_tag

kilos = flyers.map { |flyer| flyer.miles_flown * 1.6 }
puts "\nIn Kilometers:"
p kilos

total_miles = flyers.map { |flyer| flyer.miles_flown }.reduce(0, :+)
puts "\nTotal miles:"
puts total_miles

total_miles_flown = flyers.reduce(0) { |sum, flyer| sum + flyer.miles_flown }
puts "Total miles flown: #{total_miles_flown}"

total_km = flyers.map { |flyer| flyer.miles_flown * 1.6 }.reduce(0) { |sum, kms| sum + kms }
puts "\nTotal km:"
puts total_km

bronze_flyers = flyers.select { |f| f.status == :bronze }.map { |f| f.miles_flown * 1.6}.reduce(0, :+)
puts "\nBronze flyers:"
puts bronze_flyers

bronze_flyers = flyers.select { |f| f.status == :bronze }.reduce(0) { |sum, f| sum + (f.miles_flown * 1.6) }
puts "\nBronze flyers:"
puts bronze_flyers

most_miles = flyers.max_by { |flyer| flyer.miles_flown }
puts "\nMost miles:"
puts most_miles.name

top_flyer = flyers.max_by { |f| f.miles_flown }
puts "Top Flyer: #{top_flyer.name}"

# puts "\nFrequent Flyers:"
# frequent_flyers = flyers.select { |flyer| flyer.miles_flown >= 3000 }
# puts frequent_flyers

# puts "\nSeldom flyers:"
# seldom_flyers = flyers.reject { |flyer| flyer.miles_flown >= 3000 }
# puts seldom_flyers

# puts "\nPlatinum flyers?"
# puts flyers.any? { |flyer| flyer.status == :platinum }

# puts "\nFirst bronze flyer:"
# puts flyers.detect { |flyer| flyer.status == :bronze }