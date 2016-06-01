require 'pry'
require 'pry-byebug'

class YelpPage
  attr_accessor :name, :url, :rating, :price, :reviews, :location, :address, :phone, :tags, :highlights, :reservation, :good_for

  def initialize(name, url, rating, price, reviews, location, address, phone, tags, highlights, reservation, good_for)
    @name = name
    @url = url
    @rating = rating
    @price = price
    @reviews = reviews
    @location = location
    @address = address
    @phone = phone
    @tags = tags
    @highlights = highlights
    @reservation = reservation
    @good_for = good_for
  end
end
