class SmartRandomEvaluation < Evaluation
  def set_max_attempts
    @participant.max_num_attempts = NUM_OF_RUNS*5
  end

  def play
    @participant.play_smart_random(1,NUM_OF_RUNS)
  end

  def display
    if @outcome.to_f.nan?
      puts "Play smart randomly didn't succeed at all"
    else
      puts "Play smart randomly took on average #{@outcome} steps to succeed"
    end
  end
end