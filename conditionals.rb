require_relative 'movie_class'

movie = Movie.new("godfather", 11)
#
# puts movie.rank == 10
# puts movie.rank >= 10
# puts movie.rank < 10

# if movie.rank >= 10
  # puts "Hit"
# end

# puts "Hit" if movie.rank >= 10

# if movie.rank < 10
  # puts "Flop"
# end

result = movie.hit?
puts result

if movie.hit?
  puts "It's a Hit"
else
  puts "It's a Flop"
end

if movie.rank >= 10
  puts "Big Hit"
else
  puts "Big Flop"
end


