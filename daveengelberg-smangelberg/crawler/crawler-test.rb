require 'pry'
require 'pry-byebug'
require 'rubygems'
require 'mechanize'
require 'csv'

#Goal:
   #1) Find apartment listings section of craigslist using the 'mechanize' gem
       #a Use the existing form's 'query', 'min_price' and 'max_price' to trigger queries.
       #b Return the title, url, price and location for each listing
   #2)  Save the results to a CSV file using Ruby's 'csv' library
   #3) Use OOP, DRY and 'Brick By Brick' principles to build your script
       #Using the apartment.rb file to create an instance of each

#sample_apartment_url 'http://sfbay.craiglist.org/search/sfc/apa'
url = 'http://sfbay.craiglist.org/search/sfc/apa'

def scraper(url)
  scraper = Mechanize.new
  scraper.history_added = Proc.new { sleep 1.0 }

  scraper.get(url) do |page|
    form = page.form_with(:id 'searchform') do |s| #how did you identify the correct search field
      s['query'] = user_query
      s['min_price'] = user_min_price
      s['max_price'] = user_max_price
    end
    data = form.submits #why submitS and not submit (per mechanize documentation)
  end
end


user_query = "loft"
min_price = 1300
max_price = 3000
