require_relative 'participant.rb'
require_relative 'oracle.rb'
require_relative '../Day2/OneToOne/auditor.rb'
require_relative 'ManyToMany/regular_auditor.rb'
require_relative 'ManyToMany/police_officer.rb'
require_relative '../Day2/PlayingStrategies/strategies.rb'
require_relative 'simulation.rb'

def demo_one_to_one
  auditor = Auditor.new
  oracle = Oracle.new
  strategies = [:random , :linear , :smart_random , :binary_search , :reverse_linear , :cheat]
  names = ["Rachel","Monica","Ross","Joey","Chandler","Phoebe"]
  participants = Array.new


  6.times do |i|
    oracle.secret_number = i
    p = Participant.new(oracle,names[i],i,strategies[i],10)
    p.add_observer(auditor)
    participants << p
    p.play(1,8)
  end
end

def demo_many_to_many
  s = Simulation.new
  s.prepare_data
  s.simulate
  s.analyze_by_strategy
  s.analyze_by_age
  s.analyze_by_gender
end


#demo_one_to_one
demo_many_to_many








