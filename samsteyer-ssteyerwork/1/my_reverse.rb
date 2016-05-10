require 'pry'
require 'byebug'

# add binding.pry to stop and examine code

def my_reverse(word)
  the_word = word.strip.downcase.chars
  reverse = ''

  # Pop each letter off the back of the word and into the back of the new word
  the_word.length.times do |i|
    reverse << the_word.pop
  end
  return reverse
end

def palindrome?(word)
  if word.downcase.strip == my_reverse(word)
    return true
  else
    return false
  end
end

word = "  KayAk        "
puts my_reverse(word)
puts palindrome?(word)
