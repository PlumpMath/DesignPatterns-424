require_relative 'participant.rb'
class Evaluation

  NUM_OF_RUNS = 8
  attr_accessor :total_num_attempts , :total_num_failures
  attr_reader :oracle

  def initialize
    @total_num_attempts , @total_num_failures , @outcome = 0 , 0 ,0
    @oracle = Oracle.new
    @participant = Participant.new(@oracle)
  end

  def evaluate
    reset_no_attempts
    set_max_attempts
    1.upto(NUM_OF_RUNS) do |i|
      assign_secret_number(i)
      reset_no_attempts
      if play ==:success
        increment_attempts
      else
        increment_failures
      end
    end
    calc_avg_attempts
    display
  end


  # Final Method
  def reset_no_attempts
    @participant.reset
  end

  # Abstract Method
  def set_max_attemps

  end

  # Final Method
  def assign_secret_number(secret_number)
    @oracle.secret_number = secret_number
  end

  # Abstract method
  def play

  end

  # Final Method
  def increment_attempts
    @total_num_attempts += @participant.num_attempts
  end

  # Final Method
  def increment_failures
    @total_num_failures += 1
  end

  # Hook Method
  def calc_avg_attempts
    @outcome = @total_num_attempts.to_f/(NUM_OF_RUNS - @total_num_failures)
  end



  # Hook method
  def display
    if @outcome.to_f.nan?
      puts "No success"
    else
      puts "On average #{@outcome} steps to succeed"
    end
  end

end

