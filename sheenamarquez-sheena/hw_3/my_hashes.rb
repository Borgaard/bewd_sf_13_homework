my_hash = {original: 'original_val'}
my_str_hash = {"original_str" => "original_str_val"}
# puts "my_hash.length: #{my_hash.length}"
# merged_hash = {merged: 'merged_val'}
# merged = my_hash.merge(merged_hash)
# puts "my_hash: #{my_hash}"
# puts "merged: #{merged}"
# merged_bang = my_hash.merge!(merged_hash)
# puts "mergedbang: #{merged}"
# puts "my_hash: #{my_hash}"
# my_hash.select {|key,value| puts "#{key} and #{value}"}
# puts "my_hash.keys: #{my_hash.keys}"
# puts "my_hash.values: #{my_hash.values}"

puts my_hash
puts my_hash.values_at(:original)

puts my_str_hash
puts my_str_hash.values_at("original_str")
