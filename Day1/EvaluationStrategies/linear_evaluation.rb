class LinearEvaluation < Evaluation
  def set_max_attempts
    @participant.max_num_attempts = NUM_OF_RUNS*2
  end

  def play
    @participant.play_linear(1)
  end

  def display
    if @outcome.to_f.nan?
      puts "Play linearly didn't succeed at all"
    else
      puts "Play linearly took on average #{@outcome} steps to succeed"
    end
  end
end