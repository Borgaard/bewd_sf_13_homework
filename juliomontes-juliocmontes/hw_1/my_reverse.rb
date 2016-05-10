require 'pry'
require 'pry-byebug'
# add binding.pry anywhere to stop an examine the code

def my_reverse(word)
  string = word.delete(" ").chars
  result = " "
  result << string.pop until string.empty?
end

def is_palindrome(word)
  if word.delete(" ").downcase == my_reverse(word)
    print "Congrats, it's a palindrome."
  else print "Sorry, not a palindrome!"
  end
end

print "Please type in a word/phrase: "
word = gets.strip.downcase

print is_palindrome(word)
