module WaldorfAndStatler
	def self.roll_die
		rand(1..6)
	end

	def self.review(movie)
		number_rolled = roll_die
		puts "Number Rolled: #{number_rolled}"
		case number_rolled
		when 1..2
			movie.thumbs_down
			puts "#{movie.title} received a thumbs down."
		when 3..4
			puts "#{movie.title} was skipped."
		else
			movie.thumbs_up
			puts "#{movie.title} received a thumbs up."
		end
	end
end


