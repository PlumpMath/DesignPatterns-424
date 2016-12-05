require_relative 'play_how.rb'
require_relative 'PlayingStrategies/smart_play.rb'
require_relative 'PlayingStrategies/random_play.rb'
require_relative 'PlayingStrategies/linear_play.rb'
require_relative 'PlayingStrategies/random_smart_play.rb'
require_relative 'PlayingStrategies/binary_search_play.rb'
require_relative 'PlayingStrategies/reverse_linear_play.rb'

# Tries to guess the 'secret' number using several different strategies
class Participant
  attr_reader  :oracle
  attr_accessor :num_attempts , :max_num_attempts

  def initialize(oracle, max_num_attempts:10)
    @oracle, @max_num_attempts = oracle, max_num_attempts
    @num_attempts = 0
  end
  
  def reset
    @num_attempts = 0
  end

  def play_randomly(lower,upper)
    @play_method = RandomPlay.new(self,lower,upper)
    @play_method.play
  end

  def play_linear(lower)
    @play_method = LinearPlay.new(self,lower)
    @play_method.play
  end

  def play_smart_random(lower, upper)
    @play_method = RandomSmartPlay.new(self,lower,upper)
    @play_method.play
  end

  def play_binary_search(lower, upper)
    @play_method = BinarySearchPlay.new(self,lower,upper)
    @play_method.play
  end

  def play_reverse_linear(upper)
    @play_method = ReverseLinearPlay.new(self,0,upper)
    @play_method.play
  end
  private
  def fail
    # puts "Boo hoo. I made #{@num_attempts} attempts and failed."
    :fail
  end

end