class RandomEvaluation < Evaluation
  def set_max_attempts
    @participant.max_num_attempts = NUM_OF_RUNS*2
  end

  def play
    @participant.play_randomly(1,NUM_OF_RUNS)
  end

  def display
    if @outcome.to_f.nan?
      puts "Play randomly didn't succeed at all"
    else
      puts "Play randomly took on average #{@outcome} steps to succeed"
    end
  end
end