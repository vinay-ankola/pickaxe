class PaymentGateway
	def initialize(user, password)
		@user = user
		@password = password
	end

	def connect
		puts "\nConnected as #{@user}."
	end

	def disconnect
		puts "Disconnected as #{@user}."
	end

	def submit(type, amount)
		puts "Submitted #{type} for #{amount}."
	end

	def self.open(user, password)
		gateway = self.new("vinay", "secret")
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

gateway = PaymentGateway.open("vinay", "secret")
gateway.submit(:void, 15.00)
gateway.disconnect

PaymentGateway.open("vinay", "secret") do |gateway|
	gateway.submit(:sale, 12.00)
	gateway.submit(:sale, 10.00)
end


PaymentGateway.open("vinay", "secret") do |gateway|
	gateway.submit(:refund, 5.00)
	gateway.submit(:refund, 20.00)
	raise "Whoops!"
end
