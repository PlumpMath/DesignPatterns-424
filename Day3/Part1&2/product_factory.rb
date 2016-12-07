require 'singleton'
require_relative 'products.rb'
class ProductFactory
  include Singleton

  def create_products_multiple(classes = [], out = [])
    classes.each do |class_name|
      out << class_name.new
    end
    out
  end

  def create_product_a
    ProductA.new
  end

  def create_product_b
    ProductB.new
  end

  def create_product_c
    ProductC.new
  end
end