#require 'pry'
#require 'pry-byebug'

# add binding.pry anywhere to stop and examine code

def my_reverse(word)
  the_word = word.strip.downcase #sanitize
  characters = the_word.chars #split into array
  new_word = "" #create new empty string

  characters.length.downto(1) do |rev| #for num of characters in word
  new_word << characters[rev - 1] #append letter
  end

  return new_word #print reverse word

end


def palendrome(word)
  if word == my_reverse(word) #check if word equals reverse word
    puts "Is Palendrome"
  else
    puts "Is not Palendrome"
  end
end

word = "foood"

puts my_reverse(word)

palendrome(word)
