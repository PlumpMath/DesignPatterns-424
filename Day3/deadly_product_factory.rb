require_relative 'product_a.rb'
require_relative 'product_b.rb'
require_relative 'product_c.rb'
require_relative 'product_d.rb'
require_relative 'product_factory.rb'


class DeadlyProductFactory < ProductFactory

  # def create_products_multiple(classes = [], out = [])
  #   classes.each do |class_name|
  #     out << class_name.new
  #   end
  #   out
  # end

  @@deadly_factory = DeadlyProductFactory.new

  def self.new
    result = super
    if result.class == DeadlyProductFactory
      @@deadly_factory
    else
      super
    end
  end

  def create_product_a
    DeadlyProductA.new
  end

  def create_product_b
    DeadlyProductB.new

  end

  def create_product_c
    DeadlyProductC.new

  end

  def create_product_d
   DeadlyProductD.new
  end

end