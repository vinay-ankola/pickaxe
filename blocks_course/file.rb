class Class
	def self.my_open(filename, mode)
		file = self.new(filename, mode)

		return file unless block_given?

		begin
			yield(file)
		ensure
			file.close
		end
end

File.my_open("letter1.txt", "w") do |f|
	f.puts "Hello!"
	f.puts "Goodbye!"
end

File.my_open("letter1.txt", "r") do |f|
	f.each { |line| puts line }
end