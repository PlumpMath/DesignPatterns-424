#
# ABSTRACT FACTORY EXERCISE
#
require_relative 'product_factory.rb'
class Client

	def initialize
		@factory = ProductFactory.instance
		# @prod_A = @factory.create_product_a
	end
	def foo
		all_products = @factory.create_products_multiple([ProductA,ProductB,ProductC])
		all_products.each { |product| product.do_my_job}

		# @prod_A.do_my_job
		# my_prod_B = @factory.create_product_b
		# my_prod_B.do_my_job
		# @prod_C = @factory.create_product_c
		# @prod_C.do_my_job
	end

	def test_singleton_feature
		first_instance = ProductFactory.instance
		second_instance = ProductFactory.instance
		if first_instance == second_instance
			puts "\nSingleton for ProductFactory successfully implemented!!!"
		end
		begin
			temp = ProductFactory.new
		rescue NoMethodError
			puts "\nWRONG USE : The initialize method for Singleton is private. So using new isn't allowed!!!"
		end
	end
end



my_client = Client.new
my_client.foo
my_client.test_singleton_feature