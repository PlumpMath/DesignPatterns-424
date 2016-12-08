require 'rspec'
require_relative 'person.rb'
require_relative 'person_states'

describe 'child behaviour' do

  before do
    @person = Person.new

  end

  it 'Initially person should be child' do
    expect(@person.state.class).to eq(Child)
  end

  it ' Child should not be able to vote' do
    expect(@person.vote).to eq(false)
  end

  it ' Child should not be able to buy a buspass' do
    expect(@person.apply_for_buspass).to eq(false)
  end

  it 'Child should not be able to conscript' do
    expect(@person.conscript).to eq(false)
  end

  it 'Child should be able to buy a medical card' do
    expect(@person.apply_for_medical_card).to eq(true)
  end
end


describe 'teenage behaviour ' do

  before do
    @person = Person.new
    13.times{@person.increment_age}
  end

  it 'Person should now have become Teenager' do
    expect(@person.state.class).to eq(Teenager)
  end

  it ' Teenager should not be able to vote' do
    expect(@person.vote).to eq(false)
  end

  it ' Teenager should be able to buy a buspass' do
    expect(@person.apply_for_buspass).to eq(true)
  end

  it 'Teenager should  be able to conscript' do
    expect(@person.conscript).to eq(true)
  end


  it 'Teenager should not be able to buy a medical card' do
    expect(@person.apply_for_medical_card).to eq(false)
  end
end


describe 'adult behaviour ' do

before do
  @person = Person.new
  18.times{@person.increment_age}

end

  it 'Person should now have become adult' do
    expect(@person.state.class).to eq(Adult)
  end

  it ' Adult should  be able to vote' do
    expect(@person.vote).to eq(true)
  end

  it ' Adult should not be able to buy a buspass' do
    expect(@person.apply_for_buspass).to eq(false)
  end

  it 'Adult should  be able to conscript' do
    expect(@person.conscript).to eq(true)
  end

it 'Adult should not be able to buy a medical card' do
  expect(@person.apply_for_medical_card).to eq(false)
end
end

describe 'pensioner_behaviour' do

  before do
    @person = Person.new
    65.times{@person.increment_age}
  end

  it 'Person should now have become pensioner' do
    expect(@person.state.class).to eq(Pensioner)
  end

  it ' Pensioner should  be able to vote' do
    expect(@person.vote).to eq(true)
  end

  it ' Pensioner should be able to buy a buspass' do
    expect(@person.apply_for_buspass).to eq(true)
  end

  it 'Pensioner should not be able to conscript' do
    expect(@person.conscript).to eq(false)
  end

  it 'Pensioner should be able to buy a medical card' do
    expect(@person.apply_for_medical_card).to eq(true)
  end
  end

  describe 'single_instance_behaviour' do
    before do
      @person1 = Person.new
      @person2 = Person.new
    end

    it 'Teenager class should not have been instantianted' do
      expect(@person1.state.states[:Adult]).to eq(0)
    end

    it 'Child class of both persons should have same object id ' do
      expect((@person1.state.states[:Child].__id__) == (@person2.state.states[:Child].__id__)).to eq(true)
    end
    it 'Adult class should not have been instantianted' do
      expect(@person1.state.states[:Adult]).to eq(0)
    end

    it 'Pensioner class should not have been instantianted' do
      expect(@person1.state.states[:Adult]).to eq(0)
    end


    before do
      13.times{@person1.increment_age}
      13.times{@person2.increment_age}

    end

    it 'Teenager class of both persons should have same object id ' do
      expect((@person1.state.states[:Teenager].__id__) == (@person2.state.states[:Teenager].__id__)).to eq(true)
    end
    it 'Adult class should not have been instantianted' do
      expect(@person1.state.states[:Adult]).to eq(0)
    end

    it 'Pensioner class should not have been instantianted' do
      expect(@person1.state.states[:Adult]).to eq(0)
    end

    before do
      5.times{@person1.increment_age}
      5.times{@person2.increment_age}

    end

    it 'Adult class of both persons should have same object id ' do
      expect((@person1.state.states[:Adult].__id__) == (@person2.state.states[:Adult].__id__)).to eq(true)
    end
    it 'Pensioner class should not have been instantianted' do
      expect(@person1.state.states[:Adult]).to eq(0)
    end

    before do
      47.times{@person1.increment_age}
      47.times{@person2.increment_age}
    end
    it 'Pensioner class of both persons should have same object id ' do
      expect((@person1.state.states[:Pensioner].__id__) == (@person2.state.states[:Pensioner].__id__)).to eq(true)
    end

    before do
      @person1.age = 30
      @person2.age = 20
    end

    it 'Adult class of both persons should have same object id ' do
      expect((@person1.state.states[:Adult].__id__) == (@person2.state.states[:Adult].__id__)).to eq(true)
    end

    before do
      @person1.age = 7
      @person2.age = 8
    end

    it 'Child class of both persons should have same object id ' do
      expect((@person1.state.states[:Child].__id__) == (@person2.state.states[:Child].__id__)).to eq(true)
    end

    before do
      @person1.age = 75
      @person2.age = 69
    end
    it 'Pensioner class of both persons should have same object id ' do
      expect((@person1.state.states[:Pensioner].__id__) == (@person2.state.states[:Pensioner].__id__)).to eq(true)
    end
  end


