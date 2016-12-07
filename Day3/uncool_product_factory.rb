require_relative 'product_a.rb'
require_relative 'product_b.rb'
require_relative 'product_c.rb'
require_relative 'product_d.rb'
require_relative 'product_factory.rb'

class UncoolProductFactory < ProductFactory

  # def create_products_multiple(classes = [], out = [])
  #   classes.each do |class_name|
  #     out << class_name.new
  #   end
  #   out
  # end
  @@uncool_factory = UncoolProductFactory.new

  def self.new
    result = super
    if result.class == UncoolProductFactory
      @@uncool_factory
    else
      super
    end
  end

  def create_product_a
    UncoolProductA.new
  end

  def create_product_b
    UncoolProductB.new

  end

  def create_product_c
    UncoolProductC.new

  end

  def create_product_d
    UncoolProductD.new

  end


end