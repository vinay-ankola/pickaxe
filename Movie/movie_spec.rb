require_relative 'movie'

describe Movie do
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
		@movie.title.should == "Goonies"
	end

	it "has an initial rank" do
		@movie.rank.should == 10
	end

	it "has a string representation" do
		@movie.to_s.should == "Goonies has a rank of 10"
	end

	it "increases by 1 when you give it a thumbs up" do
		@movie.thumbs_up
		@movie.rank.should == @initial_rank + 1
	end

	it "decreases by 1 when you give it a thumbs down" do
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

	context "has a rank of at least 10" do
		before do
			@movie = Movie.new("goonies", 10)
		end

		it "is a hit" do
			@movie.hit?.should == true
		end

		it "has a hit status" do
			@movie.status.should == "Hit"
		end
	end

	context "has a rank of less than 10" do
		before do
			@movie = Movie.new("goonies", 9)
		end

		it "is a flop" do
			@movie.hit?.should == false
		end

		it "has a flop status" do
			@movie.status.should == "Flop"
		end
	end
end