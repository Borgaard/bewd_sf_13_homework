require 'pry'
require 'pry-byebug'
require 'mechanize'
require 'csv'
require_relative 'yelp'

def scrape_connect
  Mechanize.new
end

def scrape_it(url)
  scrape_connect.history_added = Proc.new { sleep 10.0 }

  csv = ''
  until csv != '' && csv[-4..-1] == '.csv'
    csv = get_csv_name
  end

  inputs = get_user_inputs

  scrape_connect.get(url) do |search|
    form_values = search.form_with(id: 'header_find_form') do |s|
      s['find_desc'] = inputs[:query]
      s['find_loc'] = inputs[:location]
    end

  raw_results = search_results(form_values)
  parse_results(raw_results, csv)
  end
end

def get_csv_name
  puts "What do you want to name your CSV file? (Please include .csv in file name)\n"
  csv = gets.chomp
  if File.exists?(csv)
    csv = get_override_permission(csv)
  end
  return csv
end

def get_override_permission(csv)
  puts "#{csv} already exists. Do you want to override it? (y/n)\n"
  input = gets.chomp
  if input == 'y'
    return csv
  elsif input == 'n'
    csv = get_csv_name
  else
    puts "Sorry, I don't understand."
    get_override_permission(csv)
  end
  return csv
end

def get_user_inputs
  inputs = Hash.new
  q = get_user_query
  location = ""
  until location != ""
    location = get_location
  end
  inputs = {
    query: q,
    location: location
  }
end

def get_user_query
  puts "What do you want to search in Yelp? (Enter to skip)\n"
  return gets.chomp
end

def get_location
  puts "Where do you want to search? (Enter an address, city or zip code)\n"
  return gets.chomp
end

def search_results(form_values)
  results = form_values.submit
  results.search('li.regular-search-result')
end

def parse_results(raw_results, csv)
  results = []
  results << ['name', 'rating', 'location', 'address', 'phone', 'tags', 'highlights', 'reservation', 'good for']

  raw_results.each do |result|
    name = result.search('a.biz-name.js-analytics-click').text
    url = 'https://www.yelp.com' << result.search('a.biz-name.js-analytics-click')[0].attributes['href'].value
    rating = result.search('div.rating-large').children[1].attributes['title'].value.chomp(" star rating")
    price = result.search('span.business-attribute.price-range').text
    reviews = result.search('span.review-count.rating-qualifier').text.strip.chomp(' reviews')
    location = result.search('span.neighborhood-str-list').text.strip
    address = result.search('address').children[0].text.strip + ", " + result.search('address').children[2].text.strip
    phone = result.search('span.biz-phone').text.strip

    tags = ''
    result.search('span.category-str-list').children.each do |c|
      unless c.text.strip == ''
        if c.text.strip == ','
          tags << ', '
        else
          tags << c.text.strip
        end
      end
    end

    detail_results = scrape_link(url)
    highlights = detail_results[:highlights]
    reservation = detail_results[:reservation]
    good_for = detail_results[:good_for]

  y = YelpPage.new(name, url, rating, price, reviews, location, address, phone, tags, highlights, reservation, good_for)
  results << [y.name, y.url, y.rating, y.price, y.reviews, y.location, y.address, y.phone, y.tags, y.highlights, y.reservation, y.good_for]
  create_csv(results, csv)
  end
end

def scrape_link(url)
  detail_results = Hash.new

  highlights = ''
  scrape_connect.get(url).search('a.ngram').each do |highlight|
    highlights << highlight.text << ', '
  end
  highlights.chomp(', ')

  biz_info = []
  reservation = ''
  good_for = ''
  scrape_connect.get(url).search('div.ywidget').search('div.short-def-list').children.children.children.each do |c|
    biz_info << c.text.strip
  end
  if biz_info.include?('Takes Reservations')
    reservation = biz_info[biz_info.index('Takes Reservations') + 1]
  end
  if biz_info.include?('Good For')
    good_for = biz_info[biz_info.index('Good For') + 1]
  end

  return detail_results = {
    highlights: highlights,
    reservation: reservation,
    good_for: good_for
  }
end

def create_csv(results, csv)
  CSV.open(csv, 'w+') do |csv|
    results.each do |row|
      csv << row
    end
  end
end

def read_csv(file_name)
  CSV.foreach(file_name) do |row|
    puts row
    puts '\n'
  end
end

# ===================
url = 'https://www.yelp.com/'
# csv = 'yelp.csv'
scrape_it(url)
#read_csv(csv)
