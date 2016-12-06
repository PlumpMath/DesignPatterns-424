# Auditor with one-many auditor-participant relationship
class Auditor

  def isCheating?(no_attempts,outcome)
    if no_attempts <= 3 && outcome == :success
      puts "CHEAT!!"
      true
    else
      false
    end

  end

  def isCheater?(participant)
    if participant.num_attempts <=3 && participant.outcome == :success
      puts "CHEAT!!!: Participant #{participant.name} completed by using #{participant.strategy} in #{participant.num_attempts} attempts"
    end
  end
  def update(param1,param2 = nil)
    if param1.class.include? Observable
      isCheater?(param1)
    else
      isCheating?(param1,param2)
    end
  end
end