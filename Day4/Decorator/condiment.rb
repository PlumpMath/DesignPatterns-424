require_relative 'coffee.rb'
require 'forwardable'
class CoffeeCondiment
  extend Forwardable

  def_delegators :@coffee, :warm_up , :get_a_cup


  def initialize(description , cost , coffee)
    @description = description
    @cost = cost
    @coffee = coffee
    @packing_cost = 0.0
  end

  def description
    "#{@coffee.description} with #{@description}"
  end

  def cost
    total_cost = @coffee.cost + @cost
    total_cost
  end

  def take_away
    puts " Before delegating to Coffee class packing cost is #{@packing_cost}"
    @packing_cost += @coffee.take_away
    puts " Control back from delegator Coffee class. Packing cost now is #{@packing_cost}"
    @packing_cost
  end
end

class Milk < CoffeeCondiment

  def initialize(coffee)
    super('Milk', 0.50,coffee)
  end

  def take_away
    super
    @packing_cost += 0.2
    puts " Added #{@description} cost to results obtained from delegator Coffee class. Packing cost now is #{@packing_cost}"
    @packing_cost
  end

end

class Sugar < CoffeeCondiment

  def initialize(coffee)
    super('Sugar',0.20,coffee)
  end

  def take_away
    super
    @packing_cost += 0.05
    puts " Added #{@description} cost to results obtained from delegator Coffee class . Packing cost now is #{@packing_cost}"
    @packing_cost
  end


end

# Was trying to implement Composite pattern here when client wants multiple decorators
# But was not able to as decorator uses chaining
# class MultipleCondiments < CoffeeCondiment
#
#   def initialize(list_condiments, coffee)
#     @all_condiments = Array.new
#     list_condiments.each do |condiment|
#       @all_condiments << condiment
#     end
#   end
#
#   def description
#     @all_condiments.each{|condiment| @description += " #{condiment.description} , "}
#   end
#
#   def cost
#     @all_condiments.each{|condiment| @cost+= condiment.cost}
#
#   end
#
#   def take_away
#     super
#     @all_condiments.each{|condiment| @packing_cost+= condiment.packing_cost}
#   end
#
# end

