require 'pry'
require 'pry-byebug'

def get_love_interest
  print "Who you diggin' on? "
  return gets.strip.downcase
end

def offer_advice(love_interest)
  case love_interest
  when "remi spector"
    puts "#{love_interest}!? Marry 'em duder"
    return 0
  when
    /^y/i
    puts "#{love_interest}. Good choice. Names with 'y' are usually cool."
    return 1
  else
    puts "#{love_interest}, huh. cool cool... sounds good."
    return 2
  end
end

def take_action
  puts "Decision time. Want to make a move?"
  answer = gets.strip
  case answer[0]
  when /^y/i
    puts "go for it"
  when /^n/i
    puts "come onnnnn"
  else
    puts "for the best..."
  end
end

def next_steps(offer_advice)
  case offer_advice
  when 0
    puts "ACTION: make sure to tell Phil about coming a day early"
  when 1
    puts "ACTION: yonex. you could buy them a tennis racket."
  when 2
    puts "ACTION: obviously i have my doubts about your relationship"
  else
    puts "ACTION: you broke it somehow"
  end
end

def main
  love_person = get_love_interest
  first_action = offer_advice(love_person)
  take_action
  next_steps(first_action)
end

main
