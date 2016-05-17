#1 - Pull the json from the reddit API via
  # http://www.reddit.com/.json
  # http://mashable.com/stories.json
#2 - Parse it using the JSON library
#3 - Find the stories based on techniques used in the code_along (max of 25 provided)
#4 - Create a new story hash out of each story with the following keys :title, :upvotes and :category
    #title, #category and #upvotes may not be the names use
#5 - Add each story to an array
#6 - Print each story from the array on your "Front Page"
#7 - BONUS ### create an 'csv' file using the api data & Ruby's CSV library
     # -> http://ruby-doc.org/stdlib-2.2.2/libdoc/csv/rdoc/CSV.html
         #title, upvote, category are the required columns

require 'typhoeus'
require 'pry'
require 'pry-byebug'
require 'json'
require 'csv'

def connect_to_api(url)
  response = Typhoeus.get(url)
  JSON.parse(response.body)
end

def stories(json_response) #gather stories and put story hash into an array
    story_array = []
    stories = json_response["data"]["children"]
    stories.each do |story|
      story_array << create_story_hash(story["data"])
    end
    return story_array
end

def create_story_hash(story) #create a hash for each story
  { title: story["title"], upvotes: story["ups"], category: story["subreddit"] }
end

def print_array(story_array) #print array of stories
  story_array.each do |story|
    puts "The title is: #{story[:title]}"
    puts "The amount of upvotes are: #{story[:upvotes]}"
    puts "The subreddit is: #{story[:category]}"
    puts ""
  end
end

def create_csv(story_array) #export to CSV
  CSV.open("/Users/ryan/my_projects/bewd_sf_13_homework/ryangray-ryanmgray/hw_4/get_it.csv", "wb") do |csv|
    csv << ["Story Title", "# of Upvotes", "Category"]
      story_array.each do |story|
        csv << [story[:title], story[:upvotes], story[:category]]
    end
  end
end

url ='http://www.reddit.com/.json'
json_response = connect_to_api(url)

stories(json_response)
print_array(stories(json_response))
create_csv(stories(json_response))
