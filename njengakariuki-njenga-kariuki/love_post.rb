require 'pry'


def cupid
  puts "Please input who your love is?"
  love_interest = gets.strip
  cupid_love(love_interest)
end

def cupid_love(love_interest)
  puts "Do you truly love #{love_interest}?"
  puts "Answer 'Absolutely' or 'I lied'"
  answer = gets.strip
  puts "For real?! #{answer}"
  cupid_advice(answer, love_interest)
end

def cupid_advice(answer, love_interest)
  case answer
  when "Absolutely"
    puts "I am happy for you."
  when "I lied"
    puts "Stop lying, I hate you"
  else "You dont know how to read"
    cupid_love(love_interest)
  end

end









#####
puts cupid
#puts cupid_advice(answer, love_interest)
