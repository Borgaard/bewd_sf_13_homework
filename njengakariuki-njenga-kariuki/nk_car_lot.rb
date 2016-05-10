require 'pry'
#require 'pry-byebug'


##Create matching egine for each type of criteria (spereate methods)
##Print cars that may suit buyer (give them suggesstions and ask questions)


#Step 1 - Create a Carlot w/ name, model, year, electric?, color, price
def create_cars
  nissan = {name:"Nissan", model:"Sentra", year:2013, is_electric: false , color:"Black", price: 15000}
  jeep = {name:"Jeep", model:"Grand Cherokee", year:2018, is_electric: true, color:"Blue", price: 35000}
  bmw ={name:"BMW", model:"735i", year:2011, is_electric: true, color:"Yellow", price: 34000}
  tesla ={name:"Tesla", model:"Model X", year:2004, is_electric: true, color:"White", price: 60000}
  dodge ={name:"Dodge", model:"Charger", year:2016, is_electric: false, color:"Green", price: 22000}
  chevrolet ={name:"Chevrolet", model:"Malibu", year:2011, is_electric: false, color:"Cream", price: 14500}
  audi ={name:"Audi", model:"A3", year:2016, is_electric: true, color:"Orange", price: 40000}
  create_car_lot(nissan,jeep,bmw,tesla,dodge,chevrolet,audi)
end

##Step 2 - Add cars to a carlot
def create_car_lot(nissan,jeep,bmw,tesla,dodge,chevrolet,audi)
  car_lot = []
  car_lot.push(nissan,jeep,bmw,tesla,dodge,chevrolet,audi)
  user_car_input(car_lot)
end

##3 - Ask a user for two variables on their car
def user_car_input(car_lot)
  puts "Welcome to the shop! My first questions to find a car for you is whether you would like an electric vehicle? Please type 'true' or 'false' "
  electric_answer = gets.strip
  puts " Okay: #{electric_answer},Thanks! One more question to help me find what is best. If your price range is above 30K, say 30K?"
  price = gets.strip
  check_electric(electric_answer, price,car_lot)
end


##Step 4-- Check whether car is electric based on user input
def check_electric (electric_answer,price,car_lot)
  case electric_answer
  when "true"
    electric_yes= []
    car_lot.each do |car, name|
      if car[:is_electric] == true
        electric_yes.push(car)
      end
    end
    print "Okay, here are the electric options I have for you along with additional detail: #{electric_yes}"
  when "false"
    electric_no= []
    car_lot.each do |car, name|
      if car[:is_electric] == false
        electric_no.push(car)
      end
    end
    print "Okay, here are the non-electric options I have for you along with additional detail: #{electric_no}"
  else
    puts "You didnt answer me in proper format! Let's restart"
    user_car_input(car_lot)
  end
  check_price(electric_answer,price,car_lot, electric_no, electric_yes)
end

##Step 5-- Check whether price is above or below threshold.
def check_price (electric_answer,price,car_lot, electric_no, electric_yes)
  case price
  when "above"
    price_above= []
    car_lot.each do |car, name|
      if car[:price] > 30000
        price_above.push(car)
      end
    end
    print "And here are the options I have that meet your price range, both electric and non electric: #{price_above}"
  when "below"
    price_below= []
    car_lot.each do |car, name|
      if car[:price] < 30000
        price_below.push(car)
      end
    end
    print "And here are the options I have that meet your price range, both electric and non electric: #{price_below}"
  else
    puts "You didnt answer me in proper format! Let's restart"
    user_car_input(car_lot)
end
end

##Step 6-- Check both user inputs and surface cars--- struggling to nest multiple criteria into the case statment
#def check_both (electric_answer,price,car_lot, electric_no, electric_yes)
  #case price, electric_answer
  #when "above", "true"
    #price_above= []
    #car_lot.each do |car, name|
      #if car_lot[:price] > price && car_lot[:is_electric] == electric_answer
        #price_above.push(car)
      #end
    #end
    #print "It worked!"
  #when
    #price_below= []
    #car_lot.each do |car, name|
      #if car[:price] < 30000 && car[:is_electric] == true
        #price_below.push(car)
      #end
    #end
    #print "And here are the options I have that meet your price range, both electric and non electric: #{price_below}"
  #end
#end

###########
puts create_cars
