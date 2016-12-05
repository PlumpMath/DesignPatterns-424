class RandomSmartPlay < PlayHow
  def generate_seed_number()
    @num = Kernel.rand(@lower..@upper)

  end

  def generate_number()
    @num = Kernel.rand(@lower..@upper)
  end

  def before_next_iteration
    if @result == :less_than
      @upper = @num-1
    elsif @result == :greater_than
      @lower = @num+1
    end
  end

end