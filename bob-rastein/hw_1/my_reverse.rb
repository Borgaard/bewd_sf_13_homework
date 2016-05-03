require 'pry'
require 'pry-byebug'
# add binding.pry anywhere to stop and examine code

def my_reverse(old_word)
  the_word = old_word.downcase.chars
word = ""
until the_word.length == 0
  word << the_word.pop
end
return word
end

def is_palindrome?(word)
  if word.strip.downcase == my_reverse(word)
  puts  "Yay, A Palindrome!"
  else
  puts  "Booh, these don't match."
  end
end

####

print "Please enter a word here: "
word = gets.strip
puts word.downcase
puts my_reverse(word)
puts is_palindrome?(word)
