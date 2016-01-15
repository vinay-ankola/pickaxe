require_relative 'movie'

File.readlines("movies.csv").each do |line|
	title, rank = line.split(',')
	movie = Movie.new(title, rank)
	puts movie
end