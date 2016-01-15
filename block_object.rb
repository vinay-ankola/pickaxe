# block object

class ABCD
	def pass_in_block(&action)
		@stored_proc = action
	end
	def use_proc(parameter)
		@stored_proc.call(parameter)
	end
end

eg = ABCD.new
eg.pass_in_block { |param| puts "The parameter is #{param}" }
eg.use_proc(98)

###############

def create_block_object(&block)
	block
end

bo = create_block_object { |param| puts "You called me with #{param}" }
bo.call 97
bo.call "cat"

###############

bo = lambda { |param| puts "You called me with #{param}"}
bo.call 95
bo.call "orangutan"