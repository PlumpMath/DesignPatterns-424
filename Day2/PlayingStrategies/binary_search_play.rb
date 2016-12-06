class BinarySearchPlay < PlayHow
  def generate_seed_number()
    @num = (@lower+@upper)/2

  end

  def generate_number()
    @num=(@lower+@upper)/2
  end

  def before_next_iteration
    if @result == :less_than
      @upper = @num-1
    elsif @result == :greater_than
      @lower = @num+1
    end
  end

end