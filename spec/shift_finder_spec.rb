require './spec_helper.rb'
require './lib/shift_finder.rb'
require './lib/offset_maker.rb'
require './lib/key_maker.rb'

RSpec.describe ShiftFinder do
  before(:each) do

    @key_maker = KeyMaker.new("02715")
    @offset_maker = OffsetMaker.new("040895")

    @key_maker.generate_four_keys
    @offset_maker.set_offsets

    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
  end

  it 'exists' do
    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
    expect(@shift_finder).to be_instance_of(ShiftFinder)
  end

  it 'can sum keys and offsets' do
    # require "pry"; binding.pry
    expected = {"A" => "3", "B" => "27", "C" => "73", "D" => "20"}
    expect(@shift_finder.sum_of_keys_and_offsets).to eq(expected)
  end
end
