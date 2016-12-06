require_relative 'supervisory.rb'
require_relative '../../Day2/PlayingStrategies/strategies.rb'

class RegularAuditor

  include Supervisory

  attr_reader :records

  def initialize
    @records = Hash.new
    Strategies::WAYS.each {|strategy| @records[strategy] = 0 }
  end

  def update(participant)
    if participant.class.include? Observable

      if isCheater?(participant)
       # puts "CHEAT!!!: Participant #{participant.name} completed by using #{participant.strategy} in #{participant.num_attempts} attempts"
        value = @records[participant.strategy]
        value += 1
        @records[participant.strategy] = value
      end

    end
  end
end

