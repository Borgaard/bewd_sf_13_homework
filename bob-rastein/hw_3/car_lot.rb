require 'pry'
require 'pry-byebug'

# adding databases of vehicles here
def vehicle_data
  vehicles = []
  tesla = { name: "Tesla", type: "car", year: 2016, model: "Model X", price: "80000", color: "burgandy", is_electric?: true}
  yugo = { name: "Yugo", type: "car", year: 1990, model: "Superior", price: "16", color: "yellow", is_electric?: false}
  mercedes_old = { name: "Mercedes",type: "car", year: 1977, model: "240D", price: "15000", color: "white", is_electric?: false}
  mercedes_new = { name: "Mercedes", type: "car", year: 1984, model: "240D", price: "3000", color: "bleu", is_electric?: false}
  toyota = { name: "Toyota", type: "car", year: 1996, model: "Hiace", price: "2500", color: "white", is_electric?: false}
  harley_davidson = { name: "Harley Davidson", type: "motorcycle", year: 1961, model: "Chopper", price: "12000", color: "chrome", is_electric?: false}
  triumph = { name: "Triumph", type: "motorcycle", year: 1974, model: "Victory", price: "12000", color: "black", is_electric?: false}
  kawasaki = { name: "Kawasaki", type: "motorcycle", year: 2005, model: "Ninja", price: "57000", color: "purple", is_electric?: true}

  vehicles.push(tesla,yugo,mercedes_old,mercedes_new,toyota, harley_davidson, triumph, kawasaki)
    vehicles
end

# end of database of vehicles
# This is the standard greeting when someone enters Bob's car lot

def hello_shopper
  puts "Are you looking for a car or motorcycle?"

  vehicle_type = gets.strip
type_of_vehicle(vehicle_type)
# car_name_list
# motorcycle_name_list
end

def type_of_vehicle(vehicle_type)
      case vehicle_type
    when "car"
      puts "Great, we've got cars!"
  #car_name_list(vehicles)
    when "motorcycle"
      puts "Well, it's your life..."
      ## I want to go to the motorcycle_name_list here
    else
      puts "nope, you can't get that here."
      hello_shopper
  end
end

def car_name_list(vehicles)
  vehicles.each do |choice|
    if choice[:type] == "car"
      puts "we have a #{choice[:name]}"
    end
  end
end

def motorcycle_name_list(vehicles)
  vehicles.each do |choice|
    if choice[:type] == "motorcycle"
      puts "we have a #{choice[:name]}"
    end
  end
end

####
hello_shopper
#motorcycle_name_list(vehicles)
vehicles = vehicle_data
# car_name_list(vehicles)
