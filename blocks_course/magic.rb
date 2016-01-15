class Integer
	def times
		i = 0
		while i < self
			yield i
			i += 1
		end
		self
	end
end

7.times { |n| puts "#{n} echo!"}