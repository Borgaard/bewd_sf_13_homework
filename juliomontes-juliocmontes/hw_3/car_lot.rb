require 'pry'
require 'pry-byebug'


def car_data
  car_data = []
  mustang = { name: "ford", model: "mustang", year: 2017, price: 30000, color: "black", is_electric: false }
  f150 = { name: "ford", model: "f150", year: 2017, price: 40000, color: "blue", is_electric: false }
  charger = { name: "dodge", model: "charger", year: 2014, price: 28000, color: "red", is_electric: false }
  challenger = {name: "dodge", model: "challenger", year: 2017, price: 35000, color: "red", is_electric: false }
  model_x = { name: "tesla", model: "model x", year: 2014, price: 50000, color: "black", is_electric: true }
  corolla = { name: "toyota", model: "corolla", year: 2010, price: 16000, color: "red", is_electric: false }
  camry = { name: "toyota", model: "camry", year: 2002, price: 3500, color: "blue", is_electric: false }

  car_data.push(mustang,f150,charger,challenger,model_x,corolla,camry)
  car_data
end

def user_requirements
  puts "We have the following colors, please choose one: Blue, Black, Red, "
  get_color = gets.strip.downcase
  # puts "Do you prefer the car to be electric?"
  # electrical = gets.strip
  puts "What's your budget look like? (Please enter a number with no comma)"
  price_range = gets.strip.to_i
  puts "We have these brands, "
  print_brand
end

def user_input
  puts "Welcome to Ruby's Car Lot, would you like to check our inventory? "
  check_inventory = gets.strip.downcase
  case check_inventory
  when "yes", "yeah", "sure"
    puts "Okay, let's see what we have."
  when "no", "not really"
    puts "Alright, come back when you're ready!"
  else
    puts "Sorry, I didn't quite get that. Let's try that again."
    user_input
  end
  user_requirements
end

def color_choice(user_color)
  car_data.each do |car|
    if car[:color] == user_color
      puts "There is a #{car[:name]} #{car[:model]} for sale. It is #{car[:price]}\n"
    end
  end
end

def is_electric?(electric_driver)
  car_data.each do |car|
    if car[:is_electic] == electric_driver
      puts "There is a #{car[:name]} for sale. It is #{car[:price]}\n"
    end
  end
end

def price
  car_data.each do |car|
    if car
    end
  end
end

binding.pry
is_electric?(true)
