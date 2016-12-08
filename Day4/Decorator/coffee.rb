# class meant to be abstract or interface
class Coffee

  def initialize(description , cost)
    @description = description
    @cost = cost
  end

  def description
    @description
  end

  def cost
    @cost
  end

  def take_away
    # This method is suppose to be abstract and not called for this class
  end

  def warm_up
    "Your coffee is hot now. Enjoy!!!"
  end

  def get_a_cup
    "Here's a cup for your coffee!!!"
  end

end

class Decaf < Coffee
  def initialize
    super('decaffeinated coffee',2.0)
  end

  def take_away
    @packing_cost = 0.5
  end


end

class Espresso < Coffee
  def initialize
    super('espresso coffee',1.5)
  end

  def take_away
    @packing_cost = 0.2
  end
end
