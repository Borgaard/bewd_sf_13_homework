#Create a method/program that will find the best car on the lot for the customer.

require 'pry'
require 'pry-byebug'

#1 Inventory
chevrolet = {brand_name: "Chevrolet", model: "Volt", year: 2012, color: "blue", price: 30000, is_electric: true}
bmw = {brand_name: "BMW", model: "M3", year: 2009, color: "red", price: 27000, is_electric: false}
tesla = {brand_name: "Tesla", model: "Model X", year: 2017, color: "silver", price: 60000, is_electric: false}
ford = {brand_name: "Ford", model: "Focus", year: 2011, color: "black", price: 20000, is_electric: false}
porsche = {brand_name: "Porsche", model: "911", year: 2007, color: "white", price: 11000, is_electric: false}


#2 Greeting and 'temperature check for type of car desired'
#Also includes: Getting of the name, calling of next method
def welcome(list_of_cars)
  puts "Why hello there ..., oh, what was your name again?"
  name = gets.strip
  cars_in_lot(name)
end

#2 Environmental or not? Then to next method
def cars_in_lot(name, list_of_cars)
  puts "Well #{name}, first, let me ask you this- are you looking for an environmentally friendly car? Yes or no.\n"
  answer = gets.strip.downcase
  sell_car(answer, list_of_cars)
end

#3 Enironmental yes or no, then call the color_choice method
def sell_car(answer, list_of_cars)
  case answer
#Might this be in the above method? It seemed to make more sense here.
  when "yes"
      puts "Then you'll love this #{puts car[:is_electric].values if car[:is_electric] == true}.\n"
    when "no"
      puts "Oh, I see. Then how about we start with what color you were dreaming of."
      # Too complicted, but thought about >> puts "Today, we have #{list_of_cars.color.values.uniq, ","}?"
      color_choice = gets.strip.downcase
      puts "Today we have black, blue, red, silver, and white cars on the lot. Which of these is your favorite?\n"
      which_color(color_choice, list_of_cars)
    end
end

def which_color(color_choice, list_of_cars)
  case color_choice
  when "blue"
#Unsure if this is the correct syntax for what I'm trying to do-
#which is basically offer a car for each color.
      puts "Then you'll look super cool in this #{if car[:color]=="blue"
        do puts car[:color] car[:year] car[:brand_name] car[:model]}."
  when "red"
      puts "Then you'll look fire as you drive by in this #{{if car[:color]=="red"
        do puts car[:color] car[:year] car[:brand_name] car[:model]}}."
  when "black"
      puts "Then you'll be super sleek #{{if car[:color]=="black"
        do puts car[:color] car[:year] car[:brand_name] car[:model]}}."
  when "silver"
      puts "Then you'll look lightening in this #{{if car[:color]=="silver"
        do puts car[:color] car[:year] car[:brand_name] car[:model]}}."
  when "white"
      puts "Then you'll adore this #{{if car[:color]=="white"
        do puts car[:color] car[:year] car[:brand_name] car[:model]}}."
  else
    #want to list out all the color values again here
      puts "Are you sure you wouldn't love a #{list_of_cars[:color].values}"
      which_color(color_choice)
  end
end

#Attempt using .each, match
#def which_color(color_choice, list_of_cars)
#if car = ""

#To write a method that accepts an unlimited number of cars (or arguments)
#I know there is something about the * for the unlimited #, but not sure after that.
def add_new_car(cars_in_lot, *)
#Wonder if I can do this, to allow for any type of case typed in.
  new_car = gets.strip.downcase.capitalize
  list_of_cars.push(new_car)
end

#Calling of the methods
list_of_cars = []
list_of_cars.push(chevrolet, bmw, tesla, ford, porsche)
welcome(name)

#I had this> cars_in_lot(list_of_cars) but I don't think I need it since the wecome triggers it


#  -----Extra remaining notes----
# puts "Which of these cars would you like?\n"
#show_all_cars(list_of_cars)


#1 - Establish inventory: Create 5 or more hashes with cars - include 5 keys
  #- brand, model, year, price, is_electric
#2 - Create an array of hashes
#** Get user preferences, based on frames (price ceiling, out of brands, out of color, electric)
#3 - Iterate through the array using the `.each` method
#4 -  Create a basic matching method
#Practice using `if` && `unless` conditionals (print a special message when cars are good for the enviornment)
#5 -BONUS create an `:add_cars` method that takes an unlimited number of cars and transforms them into an array

#Mainly: Basic matching engine- Series of methods--
#print car options, sell an option even if it isn't exactly what the user wants.
#Electric?
#case switch for print
