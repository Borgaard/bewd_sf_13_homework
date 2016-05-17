#1 - Create 5 or more hashes with cars - include 5 keys
  #- brand, model, year, price, is_electric
#2 - Create an array of hashes
#3 - Iterate through the array using the `.each` method
#4 - Practice using `if` && `unless` conditionals (print a special message when cars are good for the enviornment)
#5 -BONUS create an `:add_cars` method that takes an unlimited number of cars and transforms them into an array

require 'pry'

cars = []
tesla_s = { brand: 'Tesla', model: 'Model S', year: 2014, price: 90000,
  is_electric: true, color: 'navy' }
tesla_x = { brand: 'Tesla', model: 'Model X', year: 2015, price: 120000,
  is_electric: true, color: 'navy' }
subb = { brand: 'Subaru', model: 'Impreza', year: 2014, price: 23000,
  is_electric: false, color: 'white' }
gus_car = { brand: 'Subaru', model: 'Crosstrek', year: 2014, price: 22000,
  is_electric: false, color: 'black' }
manos_car = { brand: 'Ford', model: 'F-150', year: 2009, price: 45000,
  is_electric: false, color: 'black' }
brock_car = { brand: 'Toyota', model: 'Corolla', year: 1994, price: 1000,
  is_electric: false, color: 'aqua' }


# A standard method to print all the info associated with a car in a sentence
def print_car(car)
  puts "We have a #{car[:year]} #{car[:brand]} #{car[:model]} in #{car[:color]} for #{car[:price]}."
end

# Print all of the names of the cars in an array of cars
# Add an extra message for EVs
def show_all_cars(cars)
  puts '---------------------------------------------------'
  cars.each do |car|
    print_car(car)
    if car[:is_electric]
      puts 'This car is electric! Thanks for going green.'
    end
    puts
  end
  puts '---------------------------------------------------'
  puts
end

#write a method that accepts an unlimited number of cars (or arguments)
def add_cars(cars, *car_list)
  car_list.each do |car|
    cars.push(car)
  end
  return cars
end

# A method to list all of the cars that have a given quality, for us in
# asking questions
def list_quality(cars, quality)
  i = cars.length

  # Convert the string that we pass in to a symbol
  sym = quality.to_sym
  answer_list = []

  # Get a list of the unique values of the quality we are looking at
  cars.each do |car|
    answer_list << car[sym]
  end
  answer_list = answer_list.uniq

  # Turn the list into coherent phrase
  answer_string = ""
  (answer_list.length - 1).times do |i|
    answer_string << answer_list[i]
    answer_string << ", "
  end

  # Add the last entry
  answer_string << "or #{answer_list[-1]}"
  return answer_string
end

# ADD INPUT CHECKING AND CASE HANDLING
# This method allows you to query the cars by color
def take_input(cars)
  customer_wants = {}
  puts "Would you like a #{list_quality(cars, "color")} car?"

  # record a color or list of colors that the user wants
  puts "(Feel free to answer multiple, seperating with commas)"
  color_wants = gets.strip.downcase
  customer_wants[:color] = color_wants.split(", ")

  # record a brand or list of brands that the user wants
  puts "Which of these brands are acceptable: #{list_quality(cars, "brand")}"
  brand_wants = gets.strip.downcase
  customer_wants[:brand] = brand_wants.split(", ")

  # Record a maximum age of the car
  puts "What is the earlist year of manufacture that you are comfortable with?"
  min_year = gets.strip.downcase
  customer_wants[:min_year] = min_year.to_i

  return customer_wants

  puts ''
end

# Find the cars that perfectly match, or partially match the car buyers wants
# The stratgy is to add any car that fits one criteria to the partial, and
# to remake the perfect matches from only the cars that fit each round
def car_matches(cars_full, customer_wants)

  partial = []
  perfect = []

  # check color
  customer_wants[:color].each do |color|
    cars_full.each do |car|
      if car[:color] == color
        partial << car
        perfect << car
      end
    end
  end

  puts 'Check 1'
  puts 'perfect'
  puts perfect

  # check brand
  customer_wants[:brand].each do |brand|
    cars_full.each do |car|
      if car[:brand].downcase == brand
        partial << car
      end
    end
  end

  perfect_2 = []
  customer_wants[:brand].each do |brand|
    perfect.each do |car|
      if car[:brand].downcase == brand
        perfect_2 << car
      end
    end
  end
  perfect = perfect_2

  puts 'Check 2'
  puts 'perfect'
  puts perfect

  # check year
  cars_full.each do |car|
    if car[:year] >= customer_wants[:min_year]
      partial << car
    end
  end

  perfect_2 = []
  perfect.each do |car|
    if car[:year] >= customer_wants[:min_year]
      perfect_2 << car
    end
  end
  perfect = perfect_2

  puts 'Check 3'
  puts 'perfect'
  puts perfect

  # remove duplicates
  perfect = perfect.uniq
  partial = partial.uniq

  puts 'perfect matches'
  show_all_cars(perfect)
  puts
  puts 'partial matches'
  show_all_cars(partial)
  puts
  return partial, perfect
end

cars_full = add_cars(cars, tesla_s, tesla_x, subb, gus_car, manos_car,
                     brock_car)
show_all_cars(cars_full)
customer_wants = take_input(cars_full)
partial, perfect = car_matches(cars_full, customer_wants)
