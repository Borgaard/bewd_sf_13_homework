require 'pry'
require 'byebug'

def find_zodiac(zodiac)
  case zodiac
  when 'aries'
    puts 'Active, Demanding, Determined, Effective, Ambitious'
  when 'taurus'
    puts 'Security, Subtle strength, Appreciation, Instruction, Patience'
  when 'gemini'
    puts 'Communication, Indecision, Inquisitive, Intelligent, Changeable'
  when 'cancer'
    puts 'motion, Diplomatic, Intensity, Impulsive, Selective'
  when 'leo'
    puts 'Ruling, Warmth, Generosity, Faithful, Initiative'
  when 'virgo'
    puts 'Analyzing, Practical, Reflective, Observation, Thoughtful'
  when 'libra'
    puts 'Balance, Justice, Truth, Beauty, Perfection'
  when 'scorpio'
    puts 'Transient, Self-Willed, Purposeful, Unyielding'
  when 'sagittarius'
    puts 'Philosophical, Motion, Experimentation, Optimism'
  when 'capricorn'
    puts 'Determination, Dominance, Perservering, Practical, Willful'
  when 'aquarius'
    puts 'Knowledge, Humanitarian, Serious, Insightful, Duplicitous'
  when 'pisces'
    puts 'Fluctuation, Depth, Imagination, Reactive, Indecisive'
  else
    puts 'Your love is out of scope.'
    get_zodiac
  end

end

def get_zodiac
  print "Name a zodiac you love: "
  zodiac = gets.chomp.strip
  puts "You named: #{zodiac}"
  find_zodiac(zodiac)
end

get_zodiac
