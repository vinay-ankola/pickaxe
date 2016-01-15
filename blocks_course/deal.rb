def deal
	faces = ["Jack", "Queen", "King", "Ace"]
	suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
	random_face = faces.sample
	random_suit = suits.sample
	if block_given?
		score = yield random_face, random_suit
		puts "your scored a #{score}"
	else
		puts "No deal!"
	end
end

deal 
# do |face, suit| 
# 	puts "Dealt a #{face} of #{suit}"
# 	face.length + suit.length
# end

puts

def progress
	0.step(100, 10) do |count|
		yield count
	end
end

progress { |percent| puts percent }

puts

def greet
  #yield "Larry", 18
  yield
end

greet { |name, age| puts "Hello, #{name}. You don't look #{age}!" }