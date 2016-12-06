require 'observer'

require_relative 'play_how.rb'
require_relative 'PlayingStrategies/random_play.rb'
require_relative 'PlayingStrategies/linear_play.rb'
require_relative 'PlayingStrategies/random_smart_play.rb'
require_relative 'PlayingStrategies/binary_search_play.rb'
require_relative 'PlayingStrategies/reverse_linear_play.rb'
require_relative 'PlayingStrategies/cheat_play.rb'
require_relative 'custom_observer.rb'

# Tries to guess the 'secret' number using several different strategies
class Participant
  include Observable , CustomObservable
  attr_reader  :oracle , :name , :age , :strategy , :outcome , :gender
  attr_accessor :num_attempts , :max_num_attempts

  def initialize(oracle, name , age, gender, strategy, max_num_attempts)
    super()
    @oracle,@name,@age,@gender,@strategy, @max_num_attempts = oracle, name , age,gender, strategy, max_num_attempts
    @num_attempts = 0
  end

  def reset
    @num_attempts = 0
  end

  def play(lower,upper = 0)
    case @strategy
      when :random
        RandomPlay.new(self,lower,upper).play
      when :linear
        LinearPlay.new(self,lower,upper).play
      when :smart_random
        RandomSmartPlay.new(self,lower,upper).play
      when :binary_search
        BinarySearchPlay.new(self,lower,upper).play
      when :reverse_linear
        ReverseLinearPlay.new(self,0,upper).play
      when :cheat
        CheatPlay.new(self,lower).play
    end
  end

  def game_over(outcome)
    # changed
    # notify_observers(@num_attempts,outcome)
    @outcome = outcome
    changed
    notify_observers(self)
    broadcast_to_observers()
  end
  private
  def fail
    # puts "Boo hoo. I made #{@num_attempts} attempts and failed."
    :fail
  end

end