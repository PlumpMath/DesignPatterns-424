class ProductFactory
  attr_accessor :id
  @@current_factory = ProductFactory.new

  def self.new
    result = super
    if result.class == ProductFactory
      @@current_factory
    else
      super
    end
  end


  def getCoolProductFactory
    @@current_factory = CoolProductFactory.new
  end

  def getUncoolProductFactory
    @@current_factory = UncoolProductFactory.new

  end

  def getDeadlyProductFactory
    @@current_factory = DeadlyProductFactory.new
  end

  def create_product_a
    raise "DEVELOPER SAYS: No product factory defined!!!"
  end

  def create_product_b
    raise "DEVELOPER SAYS: No product factory defined!!!"

  end

  def create_product_c
    raise "DEVELOPER SAYS: No product factory defined!!!"

  end

  def create_product_d
    raise "DEVELOPER SAYS: No product factory defined!!!"

  end


  def create_products_all(out = [])
    out << create_product_a
    out << create_product_b
    out << create_product_c
    out << create_product_d
  end
end