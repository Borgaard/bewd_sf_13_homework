#1 - Create 5 or more hashes with cars - include 5 keys
  #- brand, model, year, price, is_electric
#2 - Create an array of hashes
#3 - Iterate through the array using the `.each` method
#4 - Practice using `if` && `unless` conditionals (print a special message when cars are good for the enviornment)
#5 -BONUS create an `:add_cars` method that takes an unlimited number of cars and transforms them into an array

#1 - Establish Inventory - need array with hashes that has info about each car
#2 - Car buyer preferences via user input
#3 - Basic matching engine ---> series of methods (electric, price ceiling, color, brand) ---> limit this stuff. Create a series of methods - keep it simple. The script should call these methods.
#4 - Print cars that may suit buyer.

require 'pry'


def show_all_cars(cars)
end

#write a method that accepts an unlimited number of cars (or arguments)
def add_cars(*cars)
  return cars #this returns an array of cars
end


#Establish Inventory for Car Lot and :add_cars
tesla = { name: "Tesla", model: "Model X", year: 2017, color: "Red", is_electric: true, price: 80000, country: "USA" }
ford = { name: "Ford", model: "F150", year: 1972, color: "Blue", is_electric: false, price: 5000, country: "USA" }
bmw = { name: "BMW", model: "Z322", year: 1989, color: "Black", is_electric: true, price: 8000, country: "Germany" }
honda = { name: "BMW", model: "Z322", year: 1989, color: "Black", is_electric: false, price: 4000, country: "Japan" }
jaguar = { name: "Jaguar", model: "Bond", year: 2016, color: "Gold", is_electric: true, price: 88000, country: "UK" }
toyota = { name: "Toyota", model: "Camry", year: 2010, color: "White", is_electric: false, price: 25000, country: "Japan" }
chevrolet = { name: "Chevrolet", model: "Mountain", year: 1955, color: "Green", is_electric: false, price: 2000, country: "USA" }
fiat = { name: "Fiat", model: "Mini", year: 1997, color: "Orange", is_electric: false, price: 10000, country: "UK" }


carlot = add_cars(tesla,ford,bmw,honda,jaguar,toyota,chevrolet,fiat) #This creates an array with hashes in it.

puts carlot


def carlot_color(colored_cars)
  puts "What color car would you like to purchase?"
  user_input = gets.chomp
  puts user_input
end

def color_each(user_input)
  if carlot.each do | color | == user_input
    puts Array.new[]
    color_pref = Array.new[]
end

def car_preference(array_new)
  puts "Here are a few car options based on your color preference of #{user_input}."
end
