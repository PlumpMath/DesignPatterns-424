require_relative 'person_states.rb'
require 'forwardable'
class Person
  extend Forwardable

  def_delegators :@state  , :vote , :apply_for_buspass , :conscript , :apply_for_medical_card , :change_state
  attr_accessor :state , :age

  def initialize
    @age = 0
    @state = Child.new
  end

  def check_for_age
    if @age == 13 || @age == 18 || @age == 65
      change_state(self)
    end
  end


  def increment_age
    @age += 1
    check_for_age
  end

  def age=new_age
    unless Range.new(0,100,false).cover?(new_age)
      raise "Invalid age assigned #{new_age}"
    end
    new_age.times{increment_age}
  end

end
