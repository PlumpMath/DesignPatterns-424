require_relative 'person.rb'

person = Person.new
puts "--------- INITIALLY CHILD ---------"
person.vote
13.times{person.increment_age}
puts "--------- TEENAGER NOW --------"
person.vote
5.times{person.increment_age}
puts "--------- ADULT NOW --------"
person.vote
47.times{person.increment_age}
puts "--------- PENSIONER NOW --------"
person.vote

# for i in 1..80
#   person.increment_age();
#   person.apply_for_buspass();
#   person.vote();
#   person.conscript();
#   person.apply_for_medical_card();
# end