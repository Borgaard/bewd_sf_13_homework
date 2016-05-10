#1 - Pull the json from the reddit API via
  # http://www.reddit.com/.json
  # http://mashable.com/stories.json
#2 - Parse it using the JSON library
#3 - Find the stories based on techniques
# used in the code_along (max of 25
# provided)
#4 - Create a new story hash out of each
# story with the following keys :title,
# :upvotes and :category
    #title, #category and #upvotes
    # may not be the names use
#5 - Add each story to an array
#6 - Print each story from the array on
# your "Front Page"
#7 - BONUS ### create an 'csv' file
# using the api data & Ruby's CSV library
     # -> http://ruby-doc.org/stdlib-2.2.2/libdoc/csv/rdoc/CSV.html
         #title, upvote, category are the
         # required columns

require 'typhoeus'#library that faciltates http requests
require 'pry'
require 'pry-byebug'
require 'json'
require 'ap'
require 'csv'

def connect_to_api(url)
  response = Typhoeus.get(url)
  JSON.parse(response.body)
end

def reddit_stories(json_response)
  stories_array = json_response['data']['children']
end

def mashable_stories(json_response)
  stories_array = json_response['new']
end

def get_critical_data(story)
  critical = {}
  critical[:title] = story['data']['title']
  critical[:category] = story['data']['subreddit']
  critical[:upvotes] = story['data']['ups']
  return critical
end

def get_critical_data_mashable(story)
  critical = {}
  critical[:title] = story['title']
  critical[:category] = story['channel']
  critical[:upvotes] = story['shares']
  return critical
end

def summarize_stories(reddit_json)
  stories = reddit_stories(reddit_json)

  # Pull the critical data from each story
  summaries = []
  stories.each do |story|
    summaries << get_critical_data(story)
  end
  return summaries
end

def summarize_stories_mashable(json)
  stories = mashable_stories(json)

  # Pull the critical data from each story
  summaries = []
  stories.each do |story|
    summaries << get_critical_data_mashable(story)
  end
  return summaries
end


def store_summaries(summaries, title)
  CSV.open(title, "w") do |csv|

    # Add the title line to the csv
    csv << ["Title", "Category", "Upvotes"]

    # Add each line as a line of the csv
    summaries.each do |summary|
      csv << [summary[:title], summary[:category], summary[:upvotes]]
    end
  end
end

#---------------------------------------------------------------------#
reddit_url ='http://www.reddit.com/.json'
reddit_json_response = connect_to_api(reddit_url)

# Store all of the summaries in an array
summaries = summarize_stories(reddit_json_response)

# Send the summaries to a csv
store_summaries(summaries, "reddit_summaries.csv")

#---------------------------------------------------------------------#
# Do the same for mashable
mashable_url ='http://mashable.com/stories.json'
mashable_json_response = connect_to_api(mashable_url)

# Store all of the summaries in an array
mashable_summaries = summarize_stories_mashable(mashable_json_response)

# Send the summaries to a csv
store_summaries(mashable_summaries, "mashable_summaries.csv")
