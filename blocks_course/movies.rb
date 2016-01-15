class Movie
	attr_reader :title, :rating, :duration

	def initialize(title, rating, duration)
		@title = title
		@rating = rating
		@duration = duration
	end

	def watch
		puts "Watching #{title} - #{rating} (#{duration} mins)..."
	end
end

movie1 = Movie.new("Toy Story", "G", 81)
movie2 = Movie.new("Cast Away", "PG", 143)
movie3 = Movie.new("Apollo 13", "PG", 140)
movie4 = Movie.new("Cars", "G", 117)

class MovieQueue
	include Enumerable

	attr_reader :name

	def initialize(name)
		@name = name
		@movies = []
	end

	def add_movie(movie)
		@movies << movie
	end

	def each
		puts "\n#{@name} movies:"		
		@movies.each { |movie| yield movie }
	end

	def each_pg_movie
		puts "\nPG movies:"
		@movies.select { |movie| movie.rating == "PG" }.each { |movie| yield movie }
	end

	def each_by_rating(rating)
		puts "\nBy rating:"
		@movies.select { |movie| movie.rating == rating }.each { |movie| yield movie }
	end
end

queue = MovieQueue.new("Friday Night")
queue.add_movie(movie1)
queue.add_movie(movie2)
queue.add_movie(movie3)

queue.each do |movie| 
	movie.watch 
end

queue.each_pg_movie { |movie| movie.watch }

queue.each_by_rating("G") { |movie| movie.watch }

long_movies = queue.select { |movie| movie.duration > 100 }
p long_movies

p queue.detect { |movie| movie.title =~ /13/ }