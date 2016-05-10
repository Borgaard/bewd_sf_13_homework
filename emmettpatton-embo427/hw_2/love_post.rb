def get_love_interest
  puts "Please provide the name of a love interest: "
  name = gets.strip
  response(name)
end

def response(name)
  puts "Are you thinking of #{name}: y/n?"
  answer = gets.strip
  advice(answer, name)
  #optionally, recurse=true
end

def advice(answer, name)
  # optionally recurse=false
  case answer
    when "y"
      puts "You should say something"
    when "n"
      puts "Why not?"
    else
      puts "You gave me #{answer}. Please enter either y or n"
      response(name)
      # if recurse
      #   response(answer)
      # end
    end
end

get_love_interest
