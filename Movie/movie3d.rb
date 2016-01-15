require_relative 'movie'

module Flicks
	class Movie3D < Movie
		def initialize(title, rank, wow_factor)
			super(title, rank)
			@wow_factor = wow_factor
		end

		def thumbs_up # override the thumbs_up method in the parent Movie class
			#wow_factor = 10
			#@rank += (1 * @wow_factor)
			@wow_factor.times { super }
		end

		def show_effect
			#wow_factor = 10
			puts "Wow! " * @wow_factor
		end
	end
end

	if __FILE__ == $0
		movie3d = Movie3D.new('glee', 5, 20)
		puts movie3d.title
		puts movie3d.rank

		movie3d.thumbs_up

		puts movie3d.rank

		movie3d.show_effect
	end
