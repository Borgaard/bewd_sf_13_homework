#Classes have state and behavior
#State & Object Factory: factory that creates and instiantes robots
#Behavior: Collection of class methods, instance methods, instance variable, local variables, constants etc.,

require 'pry'
require 'pry-byebug'

class Robot

  #creates getter && setter methods for each attribute
  attr_accessor :name, :type, :origin

 #instance_factory to support creating a new robot using Robot.new
  def initialize(name,type, origin)
    @name = name
    @type = type
    @origin = origin
  end

  #class methods can be called outside of the class like Robot.make_robots(number)
  def self.make_robots(number)
    index = number.to_i
    index.times do
      robot = Robot.random_robot_maker
    end
  end

  def self.random_robot_maker
    name_arr = ['kill_bot', 'no_kill_bot']
    type_arr = ['kill', 'companion']
    origin_arr = ['apple', 'microsoft']

    name = name_arr.sample
    type = type_arr.sample
    origin = origin_arr.sample

    build_bot = Robot.new(name, type, origin)
    puts "Built: #{build_bot.name} - #{build_bot.type} - #{build_bot.origin}"
    return build_bot
  end

  #instance methods can only be called by instances of a class
  def empathy
    puts "I'm a \"#{type}\" type #{name} by #{origin}, and I'm able to display empathy."
  end

  #this is an instance method
  def flying_skills
    puts "I'm a \"#{type}\" type #{name} by #{origin}, and I'm able to fly."
  end

  def laser_fighting_skills
    puts "I'm a \"#{type}\" type #{name} by #{origin}, and I'm able to shoot lasers when I fight."
  end
end

Robot.make_robots(7)

robbie = Robot.random_robot_maker
puts "My favorite is Robbie the #{robbie.name}"
puts robbie.empathy

robert = Robot.random_robot_maker
puts "My favorite is Robert the #{robert.name}"
puts robert.flying_skills

robin_hood = Robot.random_robot_maker
puts "My favorite is Robin Hood the #{robin_hood.name}"
puts robin_hood.laser_fighting_skills
