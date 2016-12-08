require_relative 'person.rb'

person = Person.new
for i in 1..80
  person.increment_age();
  person.apply_for_buspass();
  person.vote();
  person.conscript();
  person.apply_for_medical_card();
end
