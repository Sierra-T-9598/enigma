require './spec_helper.rb'
require 'date'
require './lib/enigma.rb'

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
