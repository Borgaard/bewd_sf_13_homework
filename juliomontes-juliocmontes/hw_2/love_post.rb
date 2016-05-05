require 'pry'
require 'pry-byebug'

def get_love_interest
  puts 'Who are you crushing on bro? '
  love_interest = gets.strip
end

def user_response(get_love_interest)
  puts "Are you thinking of #{get_love_interest}?"
  puts "Answer 'Yes' or 'No'"
  answer = gets.strip.downcase
  advice(answer, get_love_interest)
end

def advice(answer, get_love_interest)
  case answer
   when "yes"
     puts "Why don't you just ask her out?"
   when "no"
     puts "It'll probably go away soon."
   else puts "That is not a valid answer, please provide a valid answer."
     user_response(get_love_interest)
   end
 end

user_response(get_love_interest)
