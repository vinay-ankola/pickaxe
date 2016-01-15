cards = ["Jack", "Queen", "King", "Ace", "Joker"]

# cards.reverse_each { |card| puts "#{card.upcase} - #{card.length}" }

scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}

# scores.each do |key, value|
# 	puts "#{key} scored a #{value}!"
# end

scores.each { |key, value| puts "#{key} scored a #{value}!" }


