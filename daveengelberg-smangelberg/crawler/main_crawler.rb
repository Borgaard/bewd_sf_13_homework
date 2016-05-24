# Gonna need all of these guys. Pry for debugging
# mechanize for scraping. Also need the csv so I can push this
# to a file that will be useful at some point.
require 'pry'
require 'pry-byebug'
require 'rubygems'
require 'mechanize'
require 'csv'
require_relative 'user_input.rb'
require_relative 'apartment.rb'
require_relative 'create_csv.rb'

# Some resources, that I used because I missed class.
# https://www.vikingcodeschool.com/posts/web-scraping-craigslist-with-rubys-mechanize-gem
# http://docs.seattlerb.org/mechanize/GUIDE_rdoc.html
#Goal:
   #1) Find apartment listings section of craigslist using the 'mechanize' gem
       #a Use the existing form's 'query', 'min_price' and 'max_price' to trigger queries.
       #b Return the title, url, price and location for each listing
   #2)  Save the results to a CSV file using Ruby's 'csv' library
   #3) Use OOP, DRY and 'Brick By Brick' principles to build your script
       #Using the apartment.rb file to create an instance of each

# This is the URL. Ideally this wouldn't be hardcoded, but for now...
url = 'http://sfbay.craiglist.org/search/sfc/apa'

# Instantiating a scraper object from the Mechanize class.
# Not sure what is happening with Proc in this area.
def initialize_scraper(url)
  scraper = Mechanize.new
  scraper.history_added = Proc.new { sleep 0.5 }
  use_scraper(scraper,url)
end

# Calling the scraper. Not 100% sure what it's iterating through with the
# |search_page| call...
def use_scraper(scraper, url)
  scraper.get(url) do |search_page|

    search_form = search_page.form_with(:id => 'searchform') do |search|

      search['query'] = @query
      search['min_price'] = @min_price
      search['max_price'] = @max_price
    end
    results_page = search_form.submit
    parse_results(results_page)
  end

end

def parse_results(results_page)
  array_of_apartments = []
  raw_results = results_page.search('p.row')
  raw_results.each do |result|
    apartment = create_apartment(result)
    array_of_apartments << apartment
  end
  create_csv(array_of_apartments)
end

def create_apartment(result)
    link = result.css('a')[1]
    name = link.text.strip
    url = "http://sfbay.craigslist.org" + link.attributes["href"].value
    price = result.search('span.price').text
    location = result.search('span.pnr').text[3..-13]
    new_apartment = Apartment.new(price, name, location, url)
    return new_apartment
end


user_requirements(url)



#
#
# http://sfbay.craigslist.org/search/sfc/apa
# 'searchform' = main search field
# "min_price" = min price, id =
# class = row for all results
# 'max_price' = max price
# 'query' or q
