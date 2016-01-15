module Jem
	class Specification 
		attr_accessor :name, :version, :summary, :description, :licenses, 
		              :authors, :email, :files, :homepage

		def initialize
			@version = '1.0.0'
			# default initialization
			yield(self) if block_given?
		end
	end
end

spec = Jem::Specification.new 
spec.name = "Vinay"
# do |s|
# 	s.name				= 'my-gem'
# 	s.version			= '2.0.0'
# 	s.summary			= 'This is a cool gem!'
# 	s.description	=	"Much longer explanation of my cool gem"
# 	s.licenses		= ['MIT']
# 	s.authors			= ["Ruby Coder"]
# 	s.email				= 'rubycoder@example.com'
# 	s.files				= ["lib/example.rb"]
# 	s.homepage		=	'https://rubygems.org/gems/example'
# end

p spec

