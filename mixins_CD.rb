module Rankable
	def thumbs_up
		puts "#{@title} has a rank of #{@rank}"
	end
end

class Movie
	include Rankable

	attr_reader :title, :rank

	def initialize(title, rank)
		@title = title.capitalize
		@rank = rank
	end
end

class Song
	include Rankable

	attr_reader :title, :rank

	def initialize(title, rank)
		@title = title.capitalize
		@rank = rank
	end
end

movie = Movie.new("goonies", 10)
movie.thumbs_up

song = Song.new("Ruby baby", 9)
song.thumbs_up


