num = 10001
4.times do 
	puts "#{num.class}: #{num}"
	num *= num
end

##

rat1 = Rational(3,4) * Rational(2,3)
puts rat1.class  # Rational
puts rat1  # 1/2

rat2 = Rational("1/2") * Rational("1/2")
puts rat2  # 1/2

com1 = Complex(1,2) * Complex(3,4)
puts com1.class  # Complex
puts com1  # -5+10i

##

# Sum of two numbers on each line of file  pr_6_num.txt
some_file = File.open("some_file.txt")

some_file.each do |line|
	  v1, v2 = line.split
	  print Integer(v1) + Integer(v2), " "
end

some_file.close

# Looping using numbers
3.times { print "X " }
1.upto(5) {|i| print i, " " }
99.downto(95) {|i| print i, " "}
50.step(80, 6) {|i| print i, " "}
puts
10.downto(7).with_index {|num, index| puts "#{index+1}: #{num}"}

# Strings
puts "#{'Ho! '*3}Merry Christmas!"

puts "now is #{ def the(a)
               'the ' + a
                end
               the('time')
        } for all bad coders..."

puts %Q!red!

puts %Q!purple!.class

puts %Q{orange}.class

puts %Q{orange}

puts %{Seconds/day = #{24*60*60}}

string = <<END_OF_STRING
  The body of the string
  is the input lines up to
  one starting with the same
  text that followed the '<<'
END_OF_STRING
puts string

VAR1 = <<-STRING1, <<-STRING2
Concat
STRING1
      enate
      STRING2
puts VAR1

# Strings and Encodings
plain_string = "dog"
puts "Encoding of #{plain_string.inspect} is #{plain_string.encoding}"