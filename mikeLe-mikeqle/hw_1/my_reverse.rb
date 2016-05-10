require 'pry'
require 'pry-byebug'

# add binding.pry anywhere to stop and examine code
def my_reverse(input)
  input_word = input.strip.downcase
  reversed_array = input_word.chars.reverse
  output_word = reversed_array.join.capitalize
end

print "Please input a string: "
word = gets.strip
puts "The reverse of #{word} is #{my_reverse(word)}"
if (word.capitalize == my_reverse(word))
  puts "This word is a palindrome"
else puts "This word is not a palindrome"
end
