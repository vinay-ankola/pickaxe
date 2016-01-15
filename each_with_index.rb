# each with index method
# each_char method of String class - returns enumerator if no block

result = []
['a', 'b', 'c'].each_with_index {|item, index| result << [item, index]}
p result

# using the each_char method of Strings
result1 = []
"cat".each_char.each_with_index {|item, index| result1 << [item, index]}
p result1
puts "result1[1] = #{result1[1]}"
# instead of each_char.each_with_index, it can be written each_char.with_index

enum = "cat".enum_for(:each_char)
p enum.to_a
p enum.to_a[1]

str = "hello\nworld"
e = str.to_enum(:each_line)
puts "#{e.next} #{e.next}"

enum_in_threes = (1..11).enum_for(:each_slice, 3)
p enum_in_threes.to_a
