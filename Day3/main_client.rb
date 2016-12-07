#
# ABSTRACT FACTORY EXERCISE
# 
require_relative 'product_factory.rb'
require_relative 'cool_product_factory.rb'
require_relative 'uncool_product_factory.rb'
require_relative 'deadly_product_factory.rb'
class Client

  def initialize(factory)
    @my_factory = factory
  end

  def create_products
    @products_list = @my_factory.create_products_all
  end

  def start_working
    if @products_list.nil? || @products_list.empty?
      create_products
    end
    @products_list.each{|product| product.do_my_job}
  end


  def my_factory=new_factory
    @my_factory = new_factory
    create_products
  end
end

def singleton?()
  a = ProductFactory.new
  a.id = 1
  b = ProductFactory.new
  b.id = 2
  if(a.id == b.id)
    puts "ID of both first & second instance of ProductFactory was reassigned. So conclusion both point to same object!!!"
  end
end

puts "\n********** COOL PRODUCTS **********"
my_client = Client.new(ProductFactory.new.getCoolProductFactory)
my_client.start_working
puts "\n********** UNCOOL PRODUCTS **********"
my_client2 = Client.new(ProductFactory.new.getUncoolProductFactory)
my_client2.start_working
puts "\n********** DEADLY PRODUCTS **********"
my_client = Client.new(ProductFactory.new.getDeadlyProductFactory)
my_client.start_working

puts "\n********* TESTING SINGLETON **********"
singleton?

puts "\n********* CHANGING FACTORY DYNAMICALLY FROM UNCOOL TO DEADLY********"
puts "\n********* OLD OUTPUT ********"
test_client = Client.new(ProductFactory.new.getUncoolProductFactory)
test_client.start_working
puts "\n********* NEW OUTPUT ********"
test_client.my_factory =ProductFactory.new.getDeadlyProductFactory
test_client.start_working

