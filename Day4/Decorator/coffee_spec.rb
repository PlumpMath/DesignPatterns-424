require 'rspec'
require_relative 'coffee.rb'
require_relative 'condiment.rb'


describe 'decaf behaviour' do

before do
  @coffee_decaf = Decaf.new
  @coffee_decaf_milk = Milk.new(Decaf.new)
  @coffee_decaf_sugar = Sugar.new(Decaf.new)
  @coffee_decaf_sugar_milk = Milk.new(Sugar.new(Decaf.new))
 end
it ' Creates a simple decaf' do
expect(@coffee_decaf.description).to eq('decaffeinated coffee')
expect(@coffee_decaf.cost).to eq(2.0)
end
it 'Creates a decaf with only milk' do
  expect(@coffee_decaf_milk.description).to eq('decaffeinated coffee with Milk')
  expect(@coffee_decaf_milk.cost).to eq(2.5)
end
it 'Creates a decaf with only sugar' do
  expect(@coffee_decaf_sugar.description).to eq('decaffeinated coffee with Sugar')
  expect(@coffee_decaf_sugar.cost).to eq(2.2)
end
it 'Creates a decaf with both sugar and milk' do
  expect(@coffee_decaf_sugar_milk.description).to eq('decaffeinated coffee with Sugar with Milk')
  expect(@coffee_decaf_sugar_milk.cost).to eq(2.7)
end
end

describe 'espresso behaviour' do
  before do
    @coffee_espresso = Espresso.new
    @coffee_espresso_milk = Milk.new(Espresso.new)
    @coffee_espresso_sugar = Sugar.new(Espresso.new)
    @coffee_espresso_sugar_milk = Milk.new(Sugar.new(Espresso.new))
  end
it 'Creates a simple espresso' do
  expect(@coffee_espresso.description).to eq('espresso coffee')
  expect(@coffee_espresso.cost).to eq(1.5)
end
it 'Creates a espresso with only milk' do
  expect(@coffee_espresso_milk.description).to eq('espresso coffee with Milk')
  expect(@coffee_espresso_milk.cost).to eq(2.0)
end
it 'Creates a espresso with only sugar' do
  expect(@coffee_espresso_sugar.description).to eq('espresso coffee with Sugar')
  expect(@coffee_espresso_sugar.cost).to eq(1.7)
end
it 'Creates a espresso with only sugar and milk' do
  expect(@coffee_espresso_sugar_milk.description).to eq('espresso coffee with Sugar with Milk')
  expect(@coffee_espresso_sugar_milk.cost).to eq(2.2)
end



end
