require 'pry'
require 'pry-byebug'
#add binding.pry anywhere to stop and examine code

def my_reverse(word)
  letters = word.strip.downcase.chars
  word_reversed = ""
  until letters.length == 0
    word_reversed << letters.pop
  end
  binding.pry
  word_reversed.capitalize
end

def is_palindrome?(word)
  if word.downcase == my_reverse(word).downcase
    puts "Yes"
  else
    puts "No"
  end
end

word = "palindrome"
puts my_reverse(word)
puts is_palindrome?(word)
