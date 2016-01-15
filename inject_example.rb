result = [1, 3, 5, 7].inject(0) {|sum, element| sum+element}
print result
puts

result1 = [1, 3, 5, 7].inject(1) {|product, element| product*element}
print result1
puts

result2 = [1, 3, 5, 7].inject(:+)
print result2
puts

result3 = [1, 3, 5, 7].inject(:*)
print result3

