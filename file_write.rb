require_relative 'playlist'

movie1 = Movie.new("goonies", 9)
movie2 = Movie.new("ghostbusters", 10)
movie3 = Movie.new("gremlins")

movies = [movie1, movie2, movie3]

File.open("movie_rankings.csv", "w") do |file|
	movies.sort.each do |movie|
		file.puts "#{movie.title},#{movie.rank}"
	end
end