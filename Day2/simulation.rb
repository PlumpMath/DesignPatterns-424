class Simulation


  def prepare_data

    @auditor = RegularAuditor.new
    @police_officer = PoliceOfficer.new
    @oracle = Oracle.new
    strategies = Strategies::WAYS
    names = ["Rachel","Monica","Ross","Joey","Chandler","Phoebe"]
    ages = [25,30,35,40,45,50,55]
    gender = [:male,:female]
    @participants = Array.new
    @male_count = @female_count = 0

    6.times do |i|
      @oracle.secret_number = i
      temp = i%2
      p = Participant.new(@oracle , names[i], ages[i],gender[temp], strategies[i],10)
      p.add_observer(@auditor)
      p.attach_observer(@police_officer)

      p.attach_observer_proc do |record|
        if record.gender == :male
          @male_count +=1
        else
          @female_count += 1
        end
      end
      @participants << p
    end




  end

  def analyze_by_strategy
    puts "\n----------- REPORT GENERATED USING IN-BUILD OBSERVABLE ---------"
    puts "************* CRIME RATE BY STRATEGY ********************"
    cheat_records = @auditor.records
    total_crimes = cheat_records.values.inject{|x,y| x += y}
    cheat_records.each do |key,value|
      percent = ((value * 100.0 )/ total_crimes).round(2)
      puts "#{percent} % crimes committed using #{key} strategy"
    end
  end

  def analyze_by_age
    puts "\n----------- REPORT GENERATED USING CUSTOM OBSERVABLE ---------"
    puts "**************** HABITUAL OFFENDERS *********************"
    offender_records = @police_officer.offenders.keys
    young = Range.new(20,30,true)
    middle_age = Range.new(30,40,true)
    old = Range.new(40,50,true)
    ancient = Range.new(50,60,false)
    stats = Hash.new(0)
    offender_records.each do |record|
      case record.age
        when young
          stats[young] += 1
        when middle_age
          stats[middle_age] += 1
        when old
          stats[old] += 1
        when ancient
          stats[ancient] += 1
      end
    end

    total_offenders = stats.values.inject{|x,y| x += y}
    stats.each do |key,value|
      percent = ((value * 100.0 )/ total_offenders).round(2)
      puts "#{percent} % habitual offenders are in #{key} age group"
    end



  end

  def analyze_by_gender
    puts "\n----------- REPORT GENERATED USING  BLOCK AS ARGUMENT TO OBSERVABLE ---------"
    puts "**************** PARTICIPATION BREAKDOWN BY GENDER*********************"
    total = @male_count + @female_count
    male_per = (@male_count * 100.0)/total.round(2)
    female_per = 100 - male_per
    puts " Male participation #{male_per} %"
    puts "Female participation #{female_per} %"
  end

  def simulate

    lower = 1
    upper = 8

    100.times do
      @oracle.secret_number = Kernel.rand(1..6)
      @participants.each do |p|
        p.play(lower,upper)
      end
    end
  end



end