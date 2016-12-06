class LinearPlay < PlayHow
  def generate_seed_number()
    @num=@lower

  end

  def generate_number()
    @num+=1
  end
end