require_relative 'condiment.rb'
require_relative 'coffee.rb'

puts "\n********* OUTPUT OF DOING SOMETHING BEFORE AND AFTER DELEGATION *********"
first_coffee = Sugar.new(Milk.new(Decaf.new))
first_coffee.take_away


coffees = [Decaf , Espresso]
condiments = [Milk , Sugar ]
all_drinks = Array.new
coffees.each do | coffee |
  condiments.each do |condiment|
    all_drinks << condiment.new(coffee.new)
  end
  all_drinks << condiments[0].new(condiments[1].new(coffee.new))
end
puts "\n********* ALL COFFEE COMBINATIONS WITH THEIR RESPECTIVE PRICES *********"

all_drinks.each do |coffee|
  puts "#{coffee.description} \t #{coffee.cost}"
end

puts "\n********* EXAMPLE OF USING DEF DELEGATORS METHOD **********"
puts first_coffee.warm_up
puts first_coffee.get_a_cup
puts "Class of first_coffee object is #{first_coffee.class} but successfully able to call functions from Coffee class instead"

