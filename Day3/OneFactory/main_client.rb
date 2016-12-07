#
# ABSTRACT FACTORY EXERCISE
#
require_relative 'one_factory.rb'
require_relative '../product_a.rb'
require_relative '../product_b.rb'
require_relative '../product_c.rb'
require_relative '../product_d.rb'

class Client

  def initialize(products_name_list)
    @products_name_list = products_name_list
    @products_list = @products_name_list.map{ |product| OneFactory.instance.create_product(product)}
  end

  def start_working
    @products_list.each{|product| product.do_my_job}
  end
end

puts "\n********** COOL CLIENT - PRODUCTS A,B,C,D **********"
cool_client = Client.new([CoolProductA, CoolProductB, CoolProductC , CoolProductD])
cool_client.start_working

puts "\n********** DEADLY CLIENT - PRODUCTS A,B,C **********"

deadly_client = Client.new([DeadlyProductA, DeadlyProductB , DeadlyProductC])
deadly_client.start_working

puts "\n********** UNCOOL CLIENT - PRODUCTS A,B **********"

uncool_client = Client.new([UncoolProductA, UncoolProductB])
uncool_client.start_working

puts "\n********** HYBRID CLIENT - PRODUCTS A,B,C,D **********"

hybrid_client = Client.new([CoolProductA, UncoolProductB, DeadlyProductC, CoolProductD])
hybrid_client.start_working