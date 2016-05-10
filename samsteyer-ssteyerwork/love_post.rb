require 'pry'
require 'pry-byebug'

def get_love_interest
  puts "Who are you in love with?"
  love = gets.strip
  handle_love_interest(love)
end

def handle_love_interest(love)
  puts "Are you ready to call #{love}?"
  puts "Please answer Yes or No..."
  response = gets.strip.downcase
  handle_response(response, love)
end

def handle_response(response, love)
  case response
    when "yes"
      puts "Go call #{love} now!"
    when "no"
      puts "OK, well maybe you can 'run into #{love} by accident'"
    else
      puts "That is not a valid answer"
      puts
      handle_love_interest(love)
    end
end

get_love_interest
