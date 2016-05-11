#1 - Create 5 or more hashes with cars - include 5 keys
  #- brand, model, year, price, is_electric
#2 - Create an array of hashes
#3 - Iterate through the array using the `.each` method
#4 - Practice using `if` && `unless` conditionals (print a special message when cars are good for the enviornment)
#5 -BONUS create an `:add_cars` method that takes an unlimited number of cars and transforms them into an array

require 'pry'

# user info
# car lot with inventory
# something that determines whether you have something they want

cars = []
acura = {name: 'Acura', model: 'Integra', year: 1991, color: 'red', price: 15000, is_electric: false}
ford = {name: 'Ford', model: 'Taurus', year: 1998, color: 'blue', price: 20000, is_electric: false}
toyota = {name: 'Toyota', model: 'Prius', year: 2010, color: 'green', price: 40000, is_electric: true}
toyota_cam = {name: 'Toyota', model: 'Camry', year: 2005, color: 'green', price: 45000, is_electric: false}
cars.push(acura, ford, toyota, toyota_cam)

#write a method that accepts an unlimited number of cars (or arguments)
def add_car(cars)
  car_lot = []
  cars.each do |new_car|
    car_lot.push(new_car)
  end
  get_requirements(car_lot)
end

def get_requirements(car_lot)
  answers = []
  puts "Are you looking for an electric car? y/n"
  electric = gets.strip.downcase
  puts "Which color car do you want? red/blue/green"
  color = gets.strip.downcase
  answers.push(electric, color)
  electric_matches = []
  match_requirements(answers, car_lot, electric_matches)
end

def match_requirements(answers, car_lot, electric_matches)
  match_electric(answers, car_lot, electric_matches)
  match_colors(answers, electric_matches)
end

def match_electric(answers, car_lot, electric_matches)
  case answers[0]
  when 'y'
    puts "Finding electric cars..."
    car_lot.each do |car|
      if car[:is_electric]
        electric_matches.push(car)
      end
    end
  when 'n'
    puts "Finding non-electric cars..."
    car_lot.each do |car|
      if !car[:is_electric]
        electric_matches.push(car)
      end
    end
  end
end

def match_colors(answers, electric_matches)
  color_matches = []
  desired_color = answers[1]
  electric_matches.each do |car|
    color_matches.push(car[:color])
  end
  if color_matches.include?(desired_color)
    puts "You're in luck! We have a #{desired_color} car for you."
  else
    puts "Sorry, we don't have a #{desired_color} car."
  end
end

add_car(cars)
