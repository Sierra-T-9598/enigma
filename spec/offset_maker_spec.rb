require './spec_helper.rb'
require 'date'
require './lib/offset_maker.rb'

RSpec.describe OffsetMaker do

  it 'exists' do
    offset_maker = OffsetMaker.new("040895")
  end

  it 'generates the offset digits from the date of transmission' do
    offset_maker = OffsetMaker.new("040895")
    expect(offset_maker.offset("040895")).to eq("1025")
  end

  it 'generates offsets A-D using the offset digits' do
    offset_maker = OffsetMaker.new("040895")
    expect(offset_maker.set_offsets).to eq({"A" => "1",
    "B" => "0", "C" => "2", "D" => "5"})
  end
end
