require 'pry'
require 'pry-byebug'

def reverse_str(user_input)
  letter = user_input.strip.downcase.chars
  reversed_input = ""
  until letter.length == 0
    reversed_input << letter.pop
  end
  return reversed_input
end

def is_palindrome?(user_input)
  puts user_input
  puts reverse_str(user_input)
  if user_input.downcase == reverse_str(user_input)
    puts "User input a palindrome."
    return true
  elsif
    puts "User did not input a palindrome."
    return false
  end
end

puts "Reverse it!"
print "Enter a string: ";
user_input = gets.chomp.strip
puts "Reversing '#{user_input}'..."
reverse_str(user_input)
is_palindrome?(user_input)
