require './spec_helper.rb'
require 'date'
require './lib/offset_maker.rb'

RSpec.describe OffsetMaker do

  it 'exists' do
    offset_maker = OffsetMaker.new("040895")
  end

  it 'generates the offsets from the date of transmission' do
    offset_maker = OffsetMaker.new("040895")
    expect(offset_maker.offsets).to eq({"A" => "1",
    "B" => "0", "C" => "2", "D" => "5"})
  end

end
