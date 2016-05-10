#1 establish inventory
#2 Car buyer preference via user input - limit the total # of options.
#3 Basic matching engine - it should call a bunch of other simple methods
#4 Print cars that suit buyers... poetic license

require 'pry'
require 'pry-byebug'

# Initial car creation - need to put these into a lot
# I think this means that they should be put into an array
nissan = { name: "Nissan", model: "Maxima", year: 1995, electric: false, color: "green", price: 4000 }
toyota = { name: "Toyota", model: "Camry", year: 2000, electric: false, color: "gold", price: 5000 }
tesla = { name: "Tesla", model: "Model S", year: 2015, electric: true, color: "black", price: 50000 }
nissan_electric = { name: "Nissan", model: "Leaf", year: 2013, electric: true, color: "red", price: 6000 }
alfa = { name: "Alfa Romeo", model: "Spyder", year: 1984, electric: false, color: "blue", price: 3500}

# Creating an array of cars that I can access from any method.
# Is this the best way to do this?
cars = [nissan, toyota, tesla, nissan_electric, alfa]

# Asking the user what is most important to them.
# Have a couple of branching conditions
def ask_user_priority(cars)
  puts "Welcome. I can search for cars with the following criteria...
  price and year. You can also
  ask about all cars in stock by typing 'stock'."
  print "Criteria: "
  user_answer = gets.strip.downcase
  matching_engine(user_answer,cars)
end

# Here is the simple matching engine. We're passing user_answer from
# ask_user_priority and passing it to this function. Possibly I don't
# need to pass cars, but can't figure out if that's true or not yet.
def matching_engine(user_answer, cars)
  case user_answer
  when "stock"
    full_inventory(cars)
  when "price"
    ask_user_price(cars)
  when "year"
    ask_user_year(cars)
  else
    puts "Sorry. I can't search by that criteria."
  end
end

# Here is the stock output (if user requested). Pretty simple, but also ends
# the program, which is suboptimal.
def full_inventory(cars)
  puts "FULL INVENTORY"
  cars.each do |car|
    puts "#{car[:name]} #{car[:model]}, #{car[:year]}, $#{car[:price]} USD"
  end
end

# Here is the year query. I want to see what year they want...
def ask_user_year(cars)
  puts "What is the oldest model you'd want to drive? "
  user_requested_year = gets.strip.to_i
  puts "You're stated year is #{user_requested_year}. Querying..."
  find_in_year(user_requested_year, cars)
end

# We pass the year in ask_user_year to this function, along with cars array.
# We run a each do on the array, looking specifically for the year value.
# We're filling up the year_approved array for the user.
def find_in_year(user_requested_year, cars)
  year_approved = []
  cars.each do |car|
    if car[:year] > user_requested_year
      year_approved.push(car)
    end
  end
  tell_user(year_approved)
end

# Here is the price query...
def ask_user_price(cars)
  puts "What is your ideal budget?"
  budget = gets.strip.to_i
  puts "You're stated budget is $#{budget} USD. Querying..."
  find_in_budget(budget,cars)
end

# We pass the budget in
def find_in_budget(budget, cars)
  budget_approved = []
  cars.each do |car|
    if car[:price].between?(budget - 1000, budget + 1000)
      budget_approved.push(car)
    end
  end
  tell_user(budget_approved)
end

def tell_user(budget_approved)
  if budget_approved.empty? == true
    puts "No cars match your requested criteria. Sorry."
  else
    puts "Here are cars that have similar (or exact) matches with your criteria."
    budget_approved.each do |car|
      puts "The #{car[:year]} #{car[:name]} #{car[:model]} in #{car[:color]} is choice. It retails for $#{car[:price]} USD."
    end
  end
end

puts "Running car search."
ask_user_priority(cars)
