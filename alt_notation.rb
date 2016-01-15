proc1 = -> arg { puts "In proc1 with #{arg}" }
proc2 = -> arg1, arg2 { puts "In proc2 with #{arg1} and #{arg2}" }
proc3 = -> (arg1, arg2) { puts "In proc2 with #{arg1} and #{arg2}" }

proc1.call "ant"
proc2.call "bee", "cat"
proc2.call "dog", "elk"

#################

def my_if(condition, then_clause, else_clause)
  if condition
    then_clause.call
  else
    else_clause.call
  end
end

4.times do |val|
  p1 = -> { puts "#{val} is small" }
  my_if val < 2, p1, -> { puts "#{val} is big" }
end

##################

def my_while(cond, &body)
  puts cond
  while cond.call
    body.call
  end
end

a = 0
my_while -> { a < 3 }   do
  puts a
  a += 1
end
