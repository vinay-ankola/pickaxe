# names = %w(Goonies Ghostbusters Goldfinger Godfather)
# puts names.sort
# puts names.sort_by { |w| w.length }

require_relative 'movie'

movie1 = Movie.new("goonies", 10)
movie2 = Movie.new("godfather", 3)
movie3 = Movie.new("goldfinger", 7)

movies = [movie1, movie2, movie3]

# comparison of movie with movie failed. 
# Ruby doesn't know how to compare two movie objects, 
# it know numbers and strings but not movie objects
puts movies.sort

#puts movies.sort_by { |movie| movie.rank }
# this sorts by low to high. But we want high to low so we call the reverse method.
# puts movies.sort_by { |movie| movie.rank }.reverse

# But that doesn't feel right, we just want to be able to call just sort
# we use the spaceship operator

puts movie1.rank <=> movie2.rank 
  # gets the value 1. Movie1 rank is greater than Movie2 rank.
puts movie2.rank <=> movie1.rank 
  # -1
puts movie1.rank <=> movie1.rank 
  # 0