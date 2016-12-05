class PlayHow

  def initialize(participant , lower , upper = 0)
    @participant , @lower , @upper , @num , @result = participant , lower , upper , 0 , 0
  end

  def play()
    generate_seed_number()
    increment_attempts
    while run_over? do
      before_next_iteration
      generate_number()
      increment_attempts
    end
    find_outcome
  end

  # Abstract Method
  def generate_seed_number()

  end
  # Final Method
  def increment_attempts
    @participant.num_attempts += 1
  end
  # Final Method
  def run_over?
    @result =  @participant.oracle.is_this_the_number?(@num)
    @result!=:correct && (@participant.num_attempts <= @participant.max_num_attempts)
  end
  # Hook Method
  def before_next_iteration

  end
  # Abstract Method
  def generate_number()

  end
  # Final Method
  def find_outcome
    if (@participant.num_attempts <= @participant.max_num_attempts)
      :success
    else
      :fail
    end
  end

end