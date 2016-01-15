class TVShows
	attr_reader :name, :rating

	def initialize(name, rating)
		@name = name
		@rating = rating
	end

	def to_s
		"#{@name} has a #{@rating} star rating!"
	end
end

show1 = TVShows.new("Gilligan's island", 5)
show2 = TVShows.new("Twilight zone", 6)
show3 = TVShows.new("Star Trek", 7)
show4 = TVShows.new("Once upon a time", 8)

class TVShowRecordings
	attr_reader :name, :shows

	def initialize(name)
		@name = name
		@shows = []
	end

	def record_show(show)
		@shows << show
	end

	def each
		@shows.each { |show| yield show }
	end
end

queue = TVShowRecordings.new("Documentaries")
queue.record_show(show1)
queue.record_show(show2)
queue.record_show(show3)
queue.record_show(show4)
#puts queue.shows[1]
queue.each { |show| puts show }

