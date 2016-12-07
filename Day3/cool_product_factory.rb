require_relative 'product_factory.rb'
require_relative 'product_a.rb'
require_relative 'product_b.rb'
require_relative 'product_c.rb'
require_relative 'product_d.rb'


class CoolProductFactory < ProductFactory

  # def create_products_multiple(classes = [], out = [])
  #   classes.each do |class_name|
  #     out << class_name.new
  #   end
  #   out
  # end

  @@cool_factory = CoolProductFactory.new

  def self.new
    result = super
    if result.class == CoolProductFactory
      @@cool_factory
    else
      super
    end
  end


  def create_product_a
    CoolProductA.new
  end

  def create_product_b
    CoolProductB.new

  end

  def create_product_c
    CoolProductC.new

  end

  def create_product_d
    CoolProductD.new

  end


end