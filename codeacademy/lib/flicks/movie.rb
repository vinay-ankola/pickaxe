module Flicks
	class Movie
		attr_reader :rank
		attr_accessor :title
		
		def initialize(title, rank=0)
			@title = title.capitalize
			@rank = rank
			@snack_carbs = Hash.new(0)
		end

		def self.from_csv(line)
				title, rank = line.split(',')
				# Movie.new(title, rank.to_i) 
				# to raise an exception if the rank is not a number
				Movie.new(title, Integer(rank))
		end

		# 20 - Input/Output
		def to_csv
			"#{@title},#{@rank}"
		end

	  # 19: Custom iterators - print each snack by movie
		def each_snack
			@snack_carbs.each do |name, carbs|
				snack = Snack.new(name, carbs)
				yield snack
			end
		end

		def carbs_consumed
			@snack_carbs.values.reduce(0, :+)
		end

		def ate_snack(snack)
			@snack_carbs[snack.name] += snack.carbs
			puts "#{@title} led to #{snack.carbs} #{snack.name} being consumed"
			puts "#{@title}'s snacks: #{@snack_carbs}"
		end
		
		def hit?
		  @rank >= 10
		end
		
		def status
		  hit? ? "Hit" : "Flop"
		end
		
		def normalized_rank
		  @rank / 10
		end
		
		def thumbs_up
			@rank += 1
		end
		
		def thumbs_down 
			@rank -= 1
		end

		def <=>(other_movie)
			other_movie.rank <=> @rank
		end
		
		def to_s
			"#{@title} has a rank of #{@rank} (#{status})"
		end
	end
end

if __FILE__ == $0
	movie1 = Movie.new("goonies", 10)
	movie1.thumbs_up
	puts movie1

	movie2 = Movie.new("ghostbusters", 10)
	movie2.thumbs_down
	puts movie2

	movie3 = Movie.new("goldfinger")
	puts movie3
end
