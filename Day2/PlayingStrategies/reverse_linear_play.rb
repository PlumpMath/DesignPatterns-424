class ReverseLinearPlay < PlayHow
  def generate_seed_number()
    @num=@upper

  end

  def generate_number()
    @num -= 1
  end
end