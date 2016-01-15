# the module uses a module-level hash, indexed by the current object ID, to store instance-specific data without using Ruby instance variables

module Test
  State = {}
  def state=(value)
    State[object_id] = value
  end
  def state
    State[object_id]
  end
end

class Client
  include Test
end

c1 = Client.new
c2 = Client.new

c1.state = 'cat'
c2.state = 'dog'

puts c1.state
puts c1.state[1]
puts c1.state.length

puts c2.state
