require_relative 'supervisory.rb'

class PoliceOfficer
  include Supervisory

  attr_reader :offenders
  def initialize
    @offenders = Hash.new
  end

  def checkRecord(participant)
    if @offenders.has_key?(participant)
      no_offences = @offenders[participant]
      if no_offences > 3
        #puts "#{participant.name} has committed more than 3 offences.Arrest!!!"

      else
        #puts "#{participant.name}'s offence count is #{no_offences}. Warn!!!"

      end

    else
      @offenders[participant] = 1
      #puts "#{participant.name}'s first offence"
    end
  end



  def update(participant)
    if participant.class.include?(Observable) && isCheater?(participant)
      checkRecord(participant)
    end
  end

end