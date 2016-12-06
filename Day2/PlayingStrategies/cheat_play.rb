class CheatPlay < PlayHow

  def initialize(participant , lower)
    super
    @answer = @participant.oracle.secret_number
    @cheat_step = Kernel.rand(1..2)
  end

  def generate_seed_number()
    @num=@lower
  end

  def generate_number()
    if @cheat_step == 0
      @num = @answer
    else
      @num+=1
      @cheat_step -= 1
    end
  end

end