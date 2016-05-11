#1 - Pull the json from the reddit API via
  # http://ign-apis.herokuapp.com/articles?startIndex=30&count=5
#2 - Parse it using the JSON library
#3 - Find the stories based on techniques used in the code_along
#4 - Create a new story hash (story) out of each story with the following keys :headline, :slug :subheadline and :network
#5 - Add each story to an array (stories)
#6 - Print each story from the array on your "Front Page"
#7 - BONUS ### create an 'csv' file using the api data & Ruby's CSV library
     # -> http://ruby-doc.org/stdlib-2.2.2/libdoc/csv/rdoc/CSV.html
         #title, upvote, category are the required columns

require 'httparty'
require 'pry'
require 'pry-byebug'
require 'json'

def connect_to_api(url)
  response = HTTParty.get(url)
  return JSON.parse(response.body)
end

# take advantage of hash utils.
def get_story_method_2(json_response)
  story = {}
  stories = []

  entries = json_response['data'] # because it's a hash

  entries.each do |entries|
    slug = entries['metadata']['slug']
    network = entries['metadata']['networks'][0]
    headline = entries['metadata']['headline']
    subheadline = entries['metadata']['subHeadline']

      story[:story] = {headline: headline, slug: slug, subheadline: subheadline, network: network}

      stories.push(story[:story])
  end
  return stories
end

# solo attempt.
def get_story_method_1(json_response)
  length = json_response['data'].length
  index = 0
  story = {}
  stories = []

  while index < length
    slug = json_response['data'][index]['metadata']['slug']
    network = json_response['data'][index]['metadata']['networks'][0]
    headline = json_response['data'][index]['metadata']['headline']
    subheadline = json_response['data'][index]['metadata']['subHeadline']

    story[:story] = {headline: headline, slug: slug, subheadline: subheadline, network: network}

    stories.push(story[:story])

    index += 1
    end
    puts stories
  return stories
end

def front_page(content)
  index = 0

  while index < content.length
    headline = content[index][:headline]
    subheadline = content[index][:subheadline]
    network = content[index][:network]
    slug = content[index][:slug]

    puts headline
    puts subheadline
    puts "#{network}: #{slug}"
    index += 1
  end
end

def record_stories(content)
  CSV.open('records.cvs', 'a+') do |cvs|
    cvs << content
  end
end

url ='http://ign-apis.herokuapp.com/articles?startIndex=30&count=5'
json_response = connect_to_api(url)
content = get_story_method_2(json_response)
front_page(content)
record_stories(content)
