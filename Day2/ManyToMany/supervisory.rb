module Supervisory


  def isCheater?(participant)
      if participant.num_attempts <=3 && participant.outcome == :success
      true
    end
  end

end