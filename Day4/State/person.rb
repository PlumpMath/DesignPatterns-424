require_relative 'person_states.rb'
require 'forwardable'
class Person
  extend Forwardable

  def_delegators :@state  , :vote , :apply_for_buspass , :conscript , :apply_for_medical_card
  attr_reader :state

  def initialize
    @age = 0
    @state = Child.new
  end

  def increment_age
    @age += 1
    case @age
      when 13
        @state = Teenager.new
      when 18
        @state = Adult.new
      when 65
        @state = Pensioner.new
    end

  end

end
