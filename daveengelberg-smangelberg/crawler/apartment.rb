require 'pry'
require 'pry-byebug'


#create an apartment class using OOP principles

class Apartment

  attr_accessor :price, :name, :location, :url

  def initialize(price, name, location, url)
    @price = price
    @name = name
    @location = location
    @url = url
  end

  def to_string
    return [@price, @name, @location, @url]
  end

end
