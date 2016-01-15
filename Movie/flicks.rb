require_relative 'playlist'
require_relative 'movie3d'

# movie1 = Movie.new("goonies", 9)
# movie2 = Movie.new("ghostbusters", 10)
# movie3 = Movie.new("gremlins")

playlist = Flicks::Playlist.new("Fozzie")
playlist.load(ARGV.shift || "movies.csv")
# playlist.add_movie(movie1)
# playlist.add_movie(movie2)
# playlist.add_movie(movie3)

# 20 - Input/Output
movie3d = Flicks::Movie3D.new('glee', 5, 20)
playlist.add_movie(movie3d)

loop do
	puts "\nEnter how many viewings or 'quit' to exit"
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		playlist.play(answer.to_i)		
	when 'quit', 'exit'
		playlist.print_stats
		break
	else
		puts "\nPlease enter a number or quit"
	end
end

playlist.save



