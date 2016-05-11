require 'pry'
require 'pry-byebug'

#add binding.pry anywhere to stop and examine code
# the_word = word.strip.downcase.chars.push(the_word())

new_word = ""
word = "abcde"
  def reverse (0..word.length-1).each do |i|
      new_word = new_word + word[word.length - i - 1]
end
