require_relative 'movie'
require_relative 'waldorf_and_statler'
require_relative 'snack_bar'
require_relative 'movie3d'

module Flicks
	class Playlist
		def initialize(name)
			@name = name
			@movies = []
		end

		# 20 - Input/Output
		def load(from_file) 
			File.readlines(from_file).each do |line|
				# title, rank = line.split(',')
				# movie = Movie.new(title, rank.to_i)
				# add_movie(movie)
				add_movie(Movie.from_csv(line))
			end
		end

		# 20 - Input/Output
		def save(to_file="movie_rankings.csv")
			File.open(to_file, "w") do |file|
				@movies.sort.each do |movie|
					#file.puts "#{movie.title},#{movie.rank}"
					file.puts movie.to_csv
				end
			end
		end
		
		def add_movie(movie)
			@movies << movie
		end
			
		def play(viewings)
			puts "#{@name}'s playlist:"
			#puts @movies
			puts @movies.sort

			snacks = SnackBar::SNACKS
			puts "\nThere are #{snacks.size} snacks available in the snack bar"

			snacks.each do |snack|
				puts "#{snack.name} has #{snack.carbs} carbs"
			end
			
			1.upto(viewings) do |count|
				puts "\nViewing #{count}:"
				@movies.each do |movie|
						WaldorfAndStatler.review(movie)
						snack = SnackBar.random
						movie.ate_snack(snack)
						#puts "#{movie.title} led to #{snack.carbs}  #{snack.name} carbs being consumed"
			      puts movie
				end
			end
		end

		def total_carbs_consumed
			@movies.reduce(0) do |sum, movie|
				sum + movie.carbs_consumed
			end
		end

		def print_stats
			puts "\n#{@name}'s Stats:"

			puts "#{total_carbs_consumed} total carbs consumed"

			@movies.sort.each do |movie|
				puts "\n#{movie.title}'s snack totals:"
				# 19: Custom iterators - print each snack by movie
				movie.each_snack do |snack|
					puts "#{snack.carbs} total #{snack.name} carbs"
				end
				puts "#{movie.carbs_consumed} grand total carbs"
			end

			hits, flops = @movies.partition { |movie| movie.hit? }

			puts "\nHits:"
			puts hits.sort

			puts "\nFlops:"
			puts flops.sort
		end
	end
end

if __FILE__ == $0
	movie = Movie.new("Interstellar", 10)
	playlist = Playlist.new("Vinay")

	playlist.add_movie(movie)
	playlist.play(2)
	playlist.print_stats
end

