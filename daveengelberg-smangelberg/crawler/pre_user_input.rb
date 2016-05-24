require 'pry'
require 'pry-byebug'

def user_requirements(url)
  puts "Hi there. This is a Craigslist webscraper. We'll help customize your search."

  puts "First off, are there any general keywords? Something like \"yard\" or \"near Bart\". Enter them now."
  @query = gets.strip

  puts "Now, is there a minimum price you would want to pay?"
  @min_price = gets.strip.to_i

  puts "Now, is there a maximum price you would want to pay?"
  @max_price = gets.strip.to_i

  puts "Gotcha. We'll target our search for \"#{@query}\" within $#{@min_price} and $#{@max_price}."

  initialize_scraper(url)
end
