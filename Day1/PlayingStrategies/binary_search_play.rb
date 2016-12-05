class BinarySearchPlay < SmartPlay
  def generate_seed_number()
    @num = (@lower+@upper)/2

  end

  def generate_number()
    @num=(@lower+@upper)/2
  end

end