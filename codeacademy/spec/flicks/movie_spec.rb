# To run type the command below
# rspec movie_spec.rb --color
# rspec movie_spec.rb --color --format doc --- when there is a Context block
# The before/do block is for removing duplication.
# The RSpec.configure block is for enabling both :should and :expect
	  #@movie.hit?.should be_false
	  #@movie.should_not be_hit

require 'flicks/movie'

module Flicks
	describe Movie do
	  # enable both :should and :expect to remove the deprecated warning.
	  RSpec.configure do |config|
		config.expect_with :rspec do |c|
		  c.syntax = [:should, :expect]
		end
	  end

	  before do
	    @initial_rank = 10
		@movie = Movie.new("goonies", @initial_rank)
	  end

	  it "has a capitalized title" do
	    #movie = Movie.new("goonies", 10)
		@movie.title.should == "Goonies"
	  end

	  it "has an initial rank" do
	    #movie = Movie.new("goonies", 10)
		@movie.rank.should == 10
	  end

	  it "has a string representation" do
	    #movie = Movie.new("goonies", 10)
	    @movie.to_s.should == "Goonies has a rank of 10 (Hit)"
	  end

	  it "increases rank by 1 when given a thumbs up" do
	    #initial_rank = 10
		#movie = Movie.new("goonies", initial_rank)
		@movie.thumbs_up
		@movie.rank.should == @initial_rank + 1
	  end

	  it "decreases rank by 1 when given a thumbs down" do
	    #initial_rank = 10
		#movie = Movie.new("goonies", initial_rank)
		@movie.thumbs_down
		@movie.rank.should == @initial_rank - 1
	  end

	  context "created with a default rank" do
	    before do
		  @movie = Movie.new("goonies")	  
		end

		it "has a rank of 0" do
		  @movie.rank.should == 0
		end
	  end
	  
	  context "with a rank of at least 10" do
	    before  do
		  @movie = Movie.new("goonies", 10)
		end
		
		it "is a hit" do
		  #@movie.hit?.should == true
		  #@movie.hit?.should be_true
		  @movie.should be_hit
		end
		
		it "has a hit status" do
		  @movie.status.should == "Hit"
		end
	  end
	  
	  context "with a rank of less than 10" do
	    before do
		  @movie = Movie.new("goonies", 8)
		end
		
		it "is not a hit" do
		  #puts "HIT?: #{@movie.hit?}"
		  @movie.hit?.should == false
		end
		
		it "has a flop status" do
	      @movie.status.should == "Flop"
		end
	  end

	end
end