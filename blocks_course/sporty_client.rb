class SportyClient
	def post(message)
		raise "Not signed in!" unless @user
		# post message to remote service
		puts "#{@user} posted message: #{message}"
	end

	def timeline
		raise "Not signed in!" unless @user
		# get timeline from remote service
		puts "#{@user} fetched timeline..."
	end

	def sign_in(user)
		# sign in to remote service
		@user = user
		puts "\n#{user} signed in"
	end

	def sign_out(user)
		# sign out of remote service
		puts "#{user} signed out!"
	end

	def as_signed_in_user(user)
		sign_in("giants_fan")
		begin
			yield
		ensure
			sign_out("giants_fan")
		end
	end

	def self.open(fan_name)
		client = self.new
		client.sign_in(fan_name)

		return client unless block_given?
		begin
			yield client
		ensure
			client.sign_out(fan_name)
		end
	end

	# def self.as_signed_in_user(user)
	# 	client = self.new
	# 	client.sign_in("gaints_fan")
	# 	begin
	# 		yield(client)
	# 	ensure
	# 		client.sign_out("giants_fan")
	# 	end
	# end
end

SportyClient.open("giants_fan") do |client|
	client.post("Ready for the new season...")
	client.post("Giants are going all the way...")
	client.timeline
end

client = SportyClient.open("giants_fan")
client.post("Ready for the new season...")
client.post("Giants are going all the way...")
client.timeline
client.sign_out("giants_fan")

# client = SportyClient.new

# client.as_signed_in_user("giants_fan") do # |client|
# 	client.post("Ready for the new season")
# 	client.post("Giants are going all the way")
# 	client.timeline
# end

# client.as_signed_in_user("yankee_fan") do
# 	client.post("Not if we can help it...")
# 	raise "Boo! Hiss!"
# end



