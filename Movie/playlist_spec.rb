require_relative 'playlist'

module Flicks
	describe Playlist do
	  RSpec.configure do |config|
			config.expect_with :rspec do |c|
			  c.syntax = [:should, :expect]
			end
	  end

	  RSpec.configure do |config|
	    config.mock_with :rspec do |c|
	      c.syntax = [:should, :expect]
	    end
	  end  

		before do
			@playlist = Playlist.new("Fozzie")
		end

		context "Thumbs up or down a movie" do
			before do
				@initial_rank = 10
				@movie = Movie.new("goonies", @initial_rank)
				@playlist.add_movie(@movie)						
			end

			it "gives the movie a thumbs up if a high number is rolled" do
				WaldorfAndStatler.stub(:roll_die).and_return(5)
				@playlist.play(1)
				@movie.rank.should == @initial_rank + 1
			end

			it "skips the movie if a middle number is rolled" do
				WaldorfAndStatler.stub(:roll_die).and_return(3)
				@playlist.play(1)
				@movie.rank.should == @initial_rank
			end

			it "gives the movie a thumbs down if a low number is rolled" do
				WaldorfAndStatler.stub(:roll_die).and_return(1)
				@playlist.play(1)
				@movie.rank.should == @initial_rank - 1
			end
		end
	end
end