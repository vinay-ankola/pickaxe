class Canvas
	attr_accessor :width, :height, :color

	def initialize(name)
		@name = name
		@width = 100
		@height = 100
		@color = :black

		yield self if block_given?
	end

	def draw_rect(x, y, width, height)
		# draws a rectangle
	end

	def to_s
		"#{@name}: #{@width}x#{@height} #{@color} canvas"
	end
end

canvas = Canvas.new("Vinay's art studio") do |c|
	c.width = 800
	c.height = 600
	c.color = :green
end

puts canvas

