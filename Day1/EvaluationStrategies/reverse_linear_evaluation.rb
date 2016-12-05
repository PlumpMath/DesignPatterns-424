class ReverseLinearEvaluation < Evaluation
  def set_max_attempts
    @participant.max_num_attempts = NUM_OF_RUNS*2
  end

  def play
    @participant.play_reverse_linear(NUM_OF_RUNS)
  end

  def display
    if @outcome.to_f.nan?
      puts "Play reverse linearly didn't succeed at all"
    else
      puts "Play reverse linearly took on average #{@outcome} steps to succeed"
    end
  end
end