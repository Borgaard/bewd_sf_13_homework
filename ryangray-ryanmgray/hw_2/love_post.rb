require 'pry'
require 'pry-byebug'


def get_love_interest
  puts "Who do you love?" # ask user for name of love interest
  love_interest = gets.strip #capture love interest
  get_response(love_interest) #call get_response to prompt how long they have loved them
end

def get_response(love_interest)
  puts "How many days have you loved #{love_interest}?" # ask user how long they have loved their love interest
  response = gets.strip #capture days they have loved their love interest
  check_response(response, love_interest) #call check_response to see if the number of days is valid
end

def check_response(response, love_interest)
  response = response.to_i #change number of days that they have loved their love interest to integer
  case
  when response < 1 #if response is string, 0, or negative number do the following
    puts "Invalid response, please enter number of days you have loved #{love_interest}"
    get_response(love_interest) #ask again how many days they have loved them
  when response <= 30 #if response is less than 30 days do the following
    puts "SERIOUSLY!?! You've only loved #{love_interest} for #{response} days? Get out of here! Who do you really love? You can say your mom, I won't judge."
    get_love_interest #call get_love_interest to ask again who their love interest is
  when response <= 100 #if response is less than 100 do the following
    puts "You've only loved #{love_interest} for #{response} days?! Are you sure it's actually love?"
    double_check #call double_check to confirm whether they really love the person
  when response > 100 #if response is greater than 100 days
    puts "Wow I don't think I could love anything for #{response} days, #{love_interest} must be filthy rich. I guess I'll give you my blessing!"
  else
    puts "Invalid response, please enter number of days you have loved #{love_interest}"
    get_response(love_interest)
  end
end

def double_check
final_answer = gets.strip.downcase
  if final_answer == "yes"
    puts "Well, I guess it's love <3!! When's the wedding? I better get a +1 invite."
  elsif final_answer == "no"
    puts "Good thing you realize that now, I knew it was too soon to be love. I'm single btw, call me."
  else
    puts "It's a simple yes or no question!! Are you sure it's love?"
    double_check
  end
end

get_love_interest
