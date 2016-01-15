
require_relative "words_from_string.rb"
require_relative "count_frequency.rb"

raw_text  = %{
The problem breaks down into two parts. First, given some text as a
string, return a list of words. That sounds like an array. Then, build a 
count for each distinct word. That sounds like a use for a hash---we can 
index it with the word and use the corresponding entry to keep a count.}

print raw_text, "\n\n"
print "*",raw_text[8...11], "*\n\n"

word_list = words_from_string(raw_text)
print word_list, "\nword-list\n"

counts = count_frequency(word_list)
print counts, "\n\n"

sorted    = counts.sort_by {|word, count| count}
print sorted, "\n\n"

top_five  = sorted.last(5)

for i in 0...5            
  word = top_five[i][0]   
  count = top_five[i][1]
  puts "#{word}:  #{count}"
end

