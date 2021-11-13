require './spec_helper.rb'
require 'date'
require './lib/key_maker.rb'
require './lib/offset_maker.rb'
require './lib/shift_finder.rb'
require './lib/enigma.rb'
###Still need to address other character edge cases in message
RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expected = {:encryption => "keder ohulw",
                :key => "02715",
                :date => "040895"}
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message with a key and date' do
    expected = {:encryption => "hello world",
                :key => "02715",
                :date => "040895"}
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end
end
