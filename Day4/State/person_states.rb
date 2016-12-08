class PersonType

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

