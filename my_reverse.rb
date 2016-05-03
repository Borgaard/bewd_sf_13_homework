require 'pry'
require 'pry-byebug'
# add binding.pry anywhere to stop and examine code

def my_reverse(string)
  char = string.downcase.chars #cleanse and turn word into seperated characters
  word = ""    #create new string to put the characters into
  until char.length == 0  #triggers a loop to continue to pop characters until length of str is0
    word << char.pop  #puts each popped character from ingested word into new string
  end
  word
end

def is_palindrome(word)
  if word == my_reverse(word)
    puts "Yes, yes it is my brother."
  else puts "No, you stupid Tumsil idiot."
  end
end



puts "Input a word right now damnit. Any word "
word = gets.chomp
puts my_reverse(word)
puts is_palindrome(word)
