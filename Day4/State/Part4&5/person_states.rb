class PersonType
  attr_accessor :states
  def initialize
    @states = {:Child => 0, :Teenager => 0 , :Adult => 0 , :Pensioner => 0}

  end

  def vote
    puts "Vote accepted"
    true
  end

  def apply_for_buspass
    puts "Pass granted"
    true
  end

  def conscript
    puts "Here's your gun"
    true
  end

  def apply_for_medical_card
    puts "Medical card granted"
    true
  end


  def change_state(person)
    new_index = (@states.keys.find_index(person.state.class.name.to_sym)) + 1
    new_state = @states.keys[new_index]
    if @states[new_state] == 0
      obj = Object.const_get(new_state).new
      @states[new_state] = obj
    else
      obj = @states[new_state]
    end
    person.state = obj
  end

end

class Child < PersonType

  def vote
    puts "Too young to vote"
    false
  end

  def conscript
    puts "Too young to be conscripted"
    false
  end

  def apply_for_buspass
    puts "Too young for a bus pass"
    false
  end

end

class Adult < PersonType

  def apply_for_buspass
    puts "Too young for a bus pass"
    false
  end
  def apply_for_medical_card
    puts "Not eligible for Medical card"
    false
  end
end

class Pensioner < PersonType


  def conscript
    puts "Too old to be conscripted"
    false
  end
end

class Teenager < PersonType

  def vote
    puts "Too young to vote"
    false
  end
  def apply_for_medical_card
    puts "Not eligible for Medical card"
    false
  end

end

