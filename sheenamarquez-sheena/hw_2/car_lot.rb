require 'pry'

def list_cars(cars)
  puts 'Listing cars:'
  cars.each do |car|
    puts "This is a #{car[:color]} #{car[:brand]}."
    puts "The #{car[:color]} #{car[:brand]} car is mine." if car[:brand] == "smart" unless car[:color] == "yellow"
    puts "The #{car[:color]} #{car[:brand]} is my boyfriends." unless car[:color] != "black"
  end
end

def add_cars(cars, *more_cars)
  puts "Adding cars... #{more_cars}"
  more_cars.each do |more_cars|
    cars.push(more_cars)
  end
  list_cars(cars)
end

tesla = {brand: "tesla", color: "silver"}
smart = {brand: "smart", color: "pink"}
jeep = {brand: "jeep", color: "black"}
hyndai = {brand: "hyndai", color: "champagne"}
smart_yel = {brand: "smart", color: "yellow"}
mini = {brand: "mini", color: "red"}
jeep_yel = {brand: "jeep", color: "yellow"}

cars = []
cars.push(tesla,jeep,mini,hyndai,smart_yel)
list_cars(cars)
add_cars(cars, jeep_yel, smart)
