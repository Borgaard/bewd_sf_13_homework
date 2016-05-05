require 'pry'
require 'pry-byebug'

def get_lover_name
  puts "Who does your heart belong to? \n"
  lover_name = gets.strip
  get_response(lover_name)
end
#Gets answer and sends it to the next method
def get_response(love_interest)
  puts "Are you thinking of #{lover_name}?\n"
  puts "Answer 'Correct' or 'Nay, that is not thine love.' \n"
  answer = gets.strip.downcase
  get_valid_answer(answer, lover_name)
end

def get_valid_answer(answer, lover_name)
  case answer
    when "yes"
      puts "Maybe you should call #{lover_name}?\n"
    when "no"
      puts "Ok, maybe call them soon. You love #{lover_name}!"
    else
      puts "Your answer is the not valid \n"
      puts "Please put 'Yes' or 'No'\n "
      get_response(lover_name)
    end
end

get_lover_name_interest
