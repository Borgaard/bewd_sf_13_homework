require 'pry'
require 'pry-byebug'
require 'csv'

def create_csv(array_of_apartments)
  puts "What would you like to call your file?"
  file_name = gets.chomp.to_s
  CSV.open(file_name, "w+") do |csv|
    array_of_apartments.each do |row|
      csv << row.to_string
    end
  end
end
