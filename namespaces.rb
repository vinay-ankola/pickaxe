module MovieSystem
	VERSION = 1.0

	def self.info
		puts "Movie system version is #{VERSION}"
	end

	class Play
	end
end

module GameSystem
	VERSION = 2.0

	def self.info
		puts "Game system version is #{VERSION}"
	end

	class Play
	end
end

puts "\n#{MovieSystem::VERSION}"
MovieSystem.info
puts MovieSystem::Play.new

puts "\n#{GameSystem::VERSION}"
GameSystem.info
puts GameSystem::Play.new
