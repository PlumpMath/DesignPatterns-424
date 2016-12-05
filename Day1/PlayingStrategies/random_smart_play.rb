class RandomSmartPlay < SmartPlay
  def generate_seed_number()
    @num = Kernel.rand(@lower..@upper)

  end

  def generate_number()
    @num = Kernel.rand(@lower..@upper)
  end


end