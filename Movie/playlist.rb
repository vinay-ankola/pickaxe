require_relative 'movie'
require_relative 'snack_bar'
require_relative 'waldorf_and_statler'

module Flicks
	class Playlist
		def initialize(name)
			@name = name.capitalize
			@movies = []
		end

		def load(from_file)
			File.readlines(from_file).each do |line|
				title, rank = line.split(',')
				movie = Movie.new(title, rank.to_i)
				add_movie(movie)
			end
		end	

		def save(to_file="movie_rankings.csv")
			File.open(to_file, "w") do |file|
				@movies.sort.each do |movie|
					file.puts "#{movie.title},#{movie.rank}"
				end
			end	
		end

		def add_movie(movie)
			@movies << movie
		end

		def play(viewings)
			puts "\n#{@name} playlist:"
			puts @movies.sort

			snacks = SnackBar::SNACKS
			
			puts "\nThere are #{snacks.size} snacks available in the snack bar."

			snacks.each do |snack|
				puts "#{snack.name} has #{snack.carbs} carbs."
			end

			puts "\n"
			1.upto(viewings) do |count|
				puts "\nViewing #{count}"
				@movies.each do |movie|
					WaldorfAndStatler.review(movie)
					snack = SnackBar.random
					movie.ate_snack(snack)
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
			puts "\n#{@name}'s stats:"

			@movies.sort.each do |movie|
				puts "\n#{movie.title}'s snack totals:"
				movie.each_snack do |snack|
					puts "#{snack.carbs} #{snack.name} carbs"
				end
				puts "#{movie.carbs_consumed} TOTAL carbs consumed"
			end

			puts "\n#{total_carbs_consumed} GRAND TOTAL carbs consumed."

			hits, flops = @movies.partition { |movie| movie.hit? }

			puts "\nHits:"
			puts hits.sort

			puts "\nFlops:"
			puts flops.sort
		end
	end
end
