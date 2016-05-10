require 'pry'
require 'pry-byebug'


def love_interested
  print "Please enter the name of the person who makes your heart skip a beat here: "
  name = gets.strip
answer_question(name)
end

def answer_question(name)
  puts "Are you thinking of #{name.capitalize} right now?"
  puts "Please answer 'Yes' or No'"
  answer = gets.strip.downcase
  get_response(answer, name)
end

def get_response(answer, name)
  case answer
  when "yes"
    puts "Give her a call!"
  when "no"
    puts "What's wrong with you?"
  else
    puts "Your answer is invalid."

    answer_question(name)
  end
end

#
#  def get_response(answer, name)
#   if response == "Yes"
#     puts "Nice one, Brother!"
#   elsif response == "No"
#     puts "that's a darn shame!"
#   else
#     puts "#{thinking_answer} is not a valid answer, stop avoiding the question."
# end
# end

# def get_reponse(answer, name)
#   if name.downcase == "jennifer"
#     puts "Excellent, #{name.upcase} got a smoking hot bod!"
#
#   elsif name.downcase == "jen"
#     puts "Excellent, #{name.upcase}'s got a smoking hot bod!"
#
#   elsif name.downcase == "jenny"
#     puts "Excellent, #{name.upcase}'s got a smoking hot bod!"
#
#   else
#     puts "Uh oh, I think you married the wrong person."
#   end
# end



#####
love_interested
