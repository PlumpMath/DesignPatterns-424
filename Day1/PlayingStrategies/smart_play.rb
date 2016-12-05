class SmartPlay < PlayHow
  def before_next_iteration
    if @result == :less_than
      @upper = @num-1
    elsif @result == :greater_than
      @lower = @num+1
    end
  end
end