#Steps to code in
#1
#2 Get  word, create space for that word
#3 downcase, unspace, and turn the word into separate characters
#4 Create new object from the reversing of characters,
#by shoveling last character-string to the beginning
#5 Create method to evaluate if word is a palindrome
#6
#7

require 'pry'
require 'pry-byebug'
#Add binding.pry anywhere to stop and examine code

#def defines a new method
#  lower_case = string.downcase
#  characters = lower_case.chars

def my_reverse(string)
  initial_word = string.strip.downcase.chars
  new_reverse_word = ""
#In same method then the going through of the word
#UNTIL there are no characters left in the initial word
  until initial_word.length == 0
    new_reverse_word << initial_word.pop
  end
  new_reverse_word.capitalize
end


#Boolean Test / compare word to see if palindrome
def is_palindrome?(new_reverse_word)
  if new_reverse_word.downcase == my_reverse(new_reverse_word).downcase
    p "Well just Madam Im Adam to meet you."
  else
    "Sorry to inform you, you are anarchist-symetrical, or asymetrical."
  end
end
#request word as input and then removes any spaces
puts "Please provide a word \n"
initial_word = gets.strip

#string = "tEst     "
puts my_reverse(initial_word)
puts is_palindrome?(initial_word)
