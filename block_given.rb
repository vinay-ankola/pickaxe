# block_given? returns true if a block is associated with current method
# r - Read only. The file must exist.
# w - Create an empty file for writing.
# a - Append to a file.The file is created if it does not exist.
# r+ - Open a file for update both reading and writing. The file must exist.
# w+ - Create an empty file for both reading and writing.
# a+ - Open a file for reading and appending. The file is created if it does not exist.

class File
	def self.open_and_process(*args)
		result = file = File.new(*args)
		if block_given?
			result = yield file
			file.close()
		end
		return result
	end
end

File.open_and_process("testfile1.txt", "a") do |file|
	#while line = file.gets
		file.puts "London bridge is falling down"
	#end
end