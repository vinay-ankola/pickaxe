# p. 89

Song = Struct.new( :title, :name, :length )

File.open("songdata") do |song_file|
	songs = []

	song_file.each do |line|
		file, length, name, title = line.chomp.split(/\s*\|\s*/)
		name.squeeze!(" ") # squeeze the spaces in name
		mins, secs = length.scan(/\d+/)
		songs << Song.new(title, name, mins.to_i*60 + secs.to_i)
	end

	puts songs[1]
end