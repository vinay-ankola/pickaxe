class PaymentGateway
	def initialize(user, password)
		@user = user
		@password = password
	end

	def connect
		# connects to remote service
		puts "\nConnected as #{@user}"
	end

	def disconnect
		# disconnects from remote service
		puts "Disconnected as #{@user}"
	end

	def submit(type, amount)
		# submits request to remote service
		puts "Submitted #{type} for #{amount}"
	end

	def self.open(user, password)
		gateway = self.new(user, password)
		gateway.connect
		
		return gateway unless block_given?

		begin
			yield(gateway)
		rescue Exception => e
			puts e.message
		ensure
			gateway.disconnect
		end
	end	
end

gateway = PaymentGateway.open("Harpo", "secret")
gateway.submit(:void, 15.00)
gateway.disconnect

PaymentGateway.open("Chico", "secret") do |gateway|
	gateway.submit(:sale, 12.00)
	gateway.submit(:sale, 10.00)
end

PaymentGateway.open("Groucho", "secret") do |gateway|
	gateway.submit(:refund, 12.00)
	gateway.submit(:refund, 10.00)
	raise "Whoops!"
end
