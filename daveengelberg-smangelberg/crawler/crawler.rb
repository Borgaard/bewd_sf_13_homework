require 'pry'
require 'pry-byebug'
require 'mechanize'
require 'csv'

###By Monday
 ##1) create apartment class 2) figure how to create new instances within create_apartment 3)figure out how to load each instance into csv 4) fix URL
 ##have a working scraper that pulls apartments that actually meet the criteria for our search
 ## add conditionals
 ##clean up the atttributes that ar epulling
 ##read through the mechanize documentatio
 a

#Goal:
  #1) Find apartment listings section of craigslist using the 'mechanize' gem
      #a Use the existing form's 'query', 'min_price' and 'max_price' to trigger queries.
      #b Return the title, url, price and location for each listing
  #2)  Save the results to a CSV file using Ruby's 'csv' library
  #3) Use OOP, DRY and 'Brick By Brick' principles to build your script
      #Using the apartment.rb file to create an instance of each

url = 'http://sfbay.craiglist.org/search/sfc/apa'

def scrape(url)
 scrape = Mechanize.new   ##mechanize si a gem that will scrape-- IT maps a page and creates an instance of everything on the page
 scraper = scraper.history_added = Proc.new { sleep 1.0 } ##sleeps the request to help throttle website

 scraper.get(url) do |page| #finding search form part of view layer
   form = page.form_with(id: 'searchform') do |s|  ##specifies the values that we wantto override within mechanize. We designate and then this will go input the value that does this
     s['query'] = "Loft"  ##make these dynamic
     s['min_price'] = 1000 ## make this dynamic
     s['max_price'] = 6000
   end
   data = form.submits
   data_results(data) ### this submits search request with the above values and returns results
 end
end

def data_results(data) ##pinpointing specific html patterns to return
  results = data.search('p.row') ##p.row is the area that shows each apartment
  results.each do |listing|
    apartment = create_apartment(listing)
  end
end


def create_apartment(listing)
 price = listing.search('span.price').text
 neighborhood = listing.search('span.pnr').text # fix this
 url = listing.css('a')[1].attributes["href"].values #just the endpoint-- **USE THIS TO CREATE FULL URL** Use string class to combine into
 name = listing.search('span.pl').text # needs to be cleansed
 Apartment.new(price,neighborhood,name,url)######## here we will create an apartment class, create an instance of it, storing variables, then a seperate method to store it into a csv
####HOMEWORK-- CREATE AN INSTANCE OF APARTMENT(here), ANOTHER METHOD TO CREATE A CSV##, CREATE A USER INPUT FOR THE SEARCH KEYS**
end

##use listing.search to find attribute; play with
## two attributes
#create a method to instantiate mechanize
#use mechanize to scan the search from elemnt of the csv
#based on input IDs they found on this page

###############
scrape(url)
SF bay area apartments / housing rentals - craigslist
