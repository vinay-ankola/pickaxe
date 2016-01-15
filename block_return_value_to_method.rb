class Array
	def find
		for i in 0..size
			value = self[i]
			#puts value
			return value if yield(value)
		end
		return nil
	end
end

abc = [1, 3, 5, 7, 9].find {|v| v*v > 80}
puts abc
puts [1, 3, 5, 7, 9].size

["H","A","L"].collect {|x| print x.succ}
puts
[1, 2, 3, 4, 5].each {|x| print x}