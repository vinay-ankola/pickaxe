#playlist_spec
# To run type the command below
# rspec playlist_spec.rb --color
# rspec playlist_spec.rb --color --format doc --- when there is a Context block

require 'flicks/playlist'

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
	    @playlist = Playlist.new("Kermit")
	  end
	  
	  context "being played with one movie" do
	    before do
			  @initial_rank = 10
			  @movie = Movie.new("goonies", @initial_rank)
			  @playlist.add_movie(@movie)
			end
		
			it "gives the movie a thumbs up if a high number is rolled" do
			  #@playlist.stub(:roll_die).and_return(5)
			  WaldorfAndStatler.stub(:roll_die).and_return(5)
			  @playlist.play(1)     # @playlist.play(5)
			  @movie.rank.should == @initial_rank + 1
			end
		
			it "skips the movie if a medium number is rolled" do
			  #@playlist.stub(:roll_die).and_return(3)
			  WaldorfAndStatler.stub(:roll_die).and_return(3)
			  @playlist.play(1)     # @playlist.play(3)
			  @movie.rank.should == @initial_rank
			end
		
			it "gives the movie a thumbs down if a low number is rolled" do
			  #@playlist.stub(:roll_die).and_return(1)
			  WaldorfAndStatler.stub(:roll_die).and_return(1)
			  @playlist.play(1)     # @playlist.play(1)
			  @movie.rank.should == @initial_rank - 1
			end
		
	  end
	end
end