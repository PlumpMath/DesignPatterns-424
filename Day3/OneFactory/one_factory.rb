require 'singleton'

class OneFactory

include Singleton
  def create_product(product_class)
    product_class.new
  end
  end