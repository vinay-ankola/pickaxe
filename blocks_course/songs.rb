require_relative 'my_enumerable'

class Song
	attr_reader :name, :artist, :duration

	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
	end

	def play
		puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
	end

	def each_filename
		basename = "#{name}-#{artist}".gsub(" ", "-").downcase
		extensions = [".mp3", ".wav", ".aac"]
		extensions.each { |ext| yield basename + ext }
	end

  # def each_filename
  #   basename = "#{name}-#{artist}".gsub(" ", "-").downcase
  #   extensions = [".mp3", ".wav", ".aac"]
  #   extensions.each { |ext| yield basename + ext }
  # end	
end

song1 = Song.new("Song of the mountain", "Neal Finn", 5)
song2 = Song.new("Return to Innocence", "Enigma", 7)
song3 = Song.new("Come undone", "Duran Duran", 6)

class Playlist
	#include Enumerable
	include MyEnumerable

	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		@songs << song
	end

	def each
		@songs.each do |song| 
			#puts "Yielding #{song.name}..."
			yield song
		end
	end

	def play_songs
		each { |song| song.play }
	end

	def each_tagline
		@songs.each { |song| yield "#{song.name} - #{song.artist}" }
	end

	def each_by_artist(artist)
		my_select { |song| song.artist == artist }.map { |song| yield song }
	end
end

playlist = Playlist.new("Songses")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

# playlist.each { |song| song.play }

# playlist.play_songs

puts "\nBy regular expression using SELECT:"
hobbit_songs = playlist.my_select { |song| song.name =~ /mountain/ }
hobbit_songs.each { |song| puts "#{song.name}, #{song.artist}, #{song.duration} mins..." }

puts "\nBy regular expression using REJECT:"
not_hobbit_songs = playlist.my_reject { |song| song.name =~ /mountain/ }
not_hobbit_songs.each { |song| puts "#{song.name}, #{song.artist}, #{song.duration} mins..." }

song_labels = playlist.my_map { |song| "#{song.name} - #{song.artist}" }
puts "\nBy song labels:"
puts song_labels

sum1 = playlist.my_map { |song| song.duration }.reduce(:+)
#sum2 = playlist.reduce(0) { |sum, song| sum + song.duration }
puts "\nBy Sum1 and Sum2: "
puts "#{sum1}" # {sum2}

puts "\nBy tagline:"
playlist.each_tagline { |tagline| puts tagline }

puts "\nBy artist:"
playlist.each_by_artist("Neal Finn") { |song| song.play }

puts "\nBy file format:"
song = Song.new("Song of the mountain", "Neal Finn", 5)
song.each_filename { |filename| puts filename }

puts "\nBy DETECT:"
by_detect = playlist.my_detect { |song| song.artist == "Neal Finn" }
puts "#{song.name}, #{song.artist}, #{song.duration} mins..."

puts "\nBy ANY?:"
result = playlist.my_any? { |song| song.artist == "Neal Finn" }
puts result

puts "\nBy REDUCE:"
total_duration = playlist.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration