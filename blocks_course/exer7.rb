def tag(tagname)
print "<#{tagname}>"
print yield
puts "</#{tagname}>"
end

tag(:h1) { "Breaking News!" }
puts
tag(:h2) { "Massive Ruby Discovered" }
puts
tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end

def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end


def with_expectation(expected_value)
	puts "Running test..."
	result = yield
	if expected_value == result
		puts "Passed."
	else
		puts "Failed."
		puts "Expected #{expected_value} but got #{result}"
	end
end

with_expectation(5) { 2 + 2 }

require 'benchmark'

elapsed_time = Benchmark.realtime do
  # run some code
  sleep(1)
end

puts "It took #{elapsed_time}"

content_tag(:h1) { "Ruby on Rails!" }
# => <h1>Ruby on Rails!</h1>
content_tag(:div) { content_tag(:p) { "Web development that doesn't hurt" } }
# => <div><p>Web development that doesn't hurt</p></div>