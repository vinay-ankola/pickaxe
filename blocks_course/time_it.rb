require 'Benchmark'

def time_it(label)
	start_time = Time.now
	yield
	elapsed_time = Time.now - start_time
	puts "#{label} took #{elapsed_time} seconds."
end


time_it("Sleepy code") do 
	sleep(0.5)
end

def time_it2(description)
	elapsed_time = Benchmark.realtime do
		yield
	end
	puts "#{description} took #{elapsed_time} secs..."
end

time_it2("Sleepy code") do
  # run some code
  sleep(1)
end