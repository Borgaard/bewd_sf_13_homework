# state
# behavior = collection of class methods, instance methods,

#Classes have state and behavior
#State & Object Factory: factory that creates and instiantes robots
#Behavior: Collection of class methods, instance methods, instance variable, local variables, constants etc.,
#Create a robot factory

# First let's just see if I can get an instance of class Robot.
# Okay, that's not too hard. setting a variable lets me create an instance
# of class Robot.
# I can pretty easily get it to print stuff too - just a.name/type/origin.
# I think I'm gonna need #array.sample to grab
# Okay, we know how to apply attributes as well. That's the whole
# instance thing. We basically just want to make sure that if we call
# one of the instance methods on one of the robots created, we can handle whether
# it does or doesn't have the attribute.

require 'pry'
require 'pry-byebug'

class Robot

  #creates getter && setter methods for each attribute
  attr_accessor :name, :type, :origin

 #instance_factory to support creating a new robot using Robot.new
  def initialize(name, type,origin)
    @name = name
    @type = type
    @origin = origin
  end

  def self.random_robot_maker
    #randomly select name, type, origin, from three different arrays
    name = ["Destructoid", "Kitten4000", "Hooman"].sample
    type = ["four wheel","two wheel", "upright"].sample
    origin = ["Belize", "China", "Canada"].sample
    robot = Robot.new(name, type, origin)
    return robot
  end

  #depending on type of robot, they will have different attributes
  #instance methods can only be called by instances of a class
  def empathy
    print "Calling empathy"
    2.times do
      sleep(0.25)
      print "."
      sleep(0.25)
    end
    puts "."
    sleep(0.25)
    if @name != "Destructoid"
      puts "SKILL DEPLOY: *** COMMENCING HUG ***"
    else
      puts "SKILL DEPLOY: No hugs bro!"
    end
  end

  #this is an instance method
  def kitten_skills
    print "Calling kitten_skills"
    2.times do
      sleep(0.25)
      print "."
      sleep(0.25)
    end
    puts "."
    sleep(0.25)
    if @name == "Kitten4000"
      puts "SKILL DEPLOY: Kitten town!"
    else
      puts "SKILL DEPLOY: Dogs for you"
    end
  end

  def fourty_mph_skills
    print "Calling Fourty_mph_skills"
    2.times do
      sleep(0.25)
      print "."
      sleep(0.25)
    end
    puts "."
    sleep(0.25)
    if @type = "four wheel" || @type = "two wheel"
      puts "SKILL DEPLOY: Your robot can move pretty fast."
    else
      puts "SKILL DEPLOY: No dice."
    end
  end

end

# This is the start of the program. Based on my understanding
# I don't think you want to combine a class for creating robots with
# a class for how many robots you want to create. Better to have a class
# that creates robots and then let the user create how many they need.
# Also I couldn't figure out how to get the array working within the class.

# Ask user how many bots they want.
puts "Welcome to the Robot Haus. How many robots do you need?"
number_of_robots_requested = gets.chomp.to_i

# creating an empty array that includes all robots that are created, so they
# could be queried
robot_array = []

# Loop through random_robot_maker
number_of_robots_requested.times do
  robot_array.push(Robot.random_robot_maker)
end


# this is a bullshit function. definitely should put some stuff into an
# array and iterate through it. So much repeated code. But anyway,
# it loops through each robot and calls each skill.
# instance class calls, bro!
robot_array.each do |robot|
  puts "You created #{robot.name}, which is #{robot.type}. It was built in #{robot.origin}. Checking skills."
  sleep(1)
  robot.empathy
  sleep(1)
  robot.kitten_skills
  sleep(1)
  robot.fourty_mph_skills
  sleep(1)
end
