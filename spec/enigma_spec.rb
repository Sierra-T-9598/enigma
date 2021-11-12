require './spec_helper.rb'
require 'date'
require './lib/key_maker.rb'
require './lib/offset_maker.rb'
require './lib/shift_finder.rb'
require './lib/enigma.rb'

RSpec.describe Enigma do
  before(:each) do
    @key_maker = KeyMaker.new("02715")
    @offset_maker = OffsetMaker.new("040895")

    @key_maker.generate_four_keys("02715")
    @offset_maker.set_offsets

    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
    @enigma = Enigma.new(@key_maker.keys, @offset_maker.offsets)
    # require "pry"; binding.pry
  end

  it 'exists' do
    expect(@enigma).to be_instance_of(Enigma)

    expected = {"A" => "3", "B" => "27", "C" => "73", "D" => "20"}
    expect(@enigma.sum_of_keys_and_offsets(@key_maker.keys, @offset_maker.offsets)).to eq(expected)
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
