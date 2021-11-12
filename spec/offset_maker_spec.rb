require './spec_helper.rb'
require 'date'
require './lib/offset_maker.rb'

RSpec.describe OffsetMaker do

  it 'exists' do
    offset_maker = OffsetMaker.new("040895")
    expect(offset_maker).to be_instance_of(OffsetMaker)
  end

  it 'generates the date of today if no date is given' do
    offset_maker_no_date = OffsetMaker.new
    expect(offset_maker_no_date).to be_instance_of(OffsetMaker)
    expect(offset_maker_no_date.date).to_not eq(nil)
  end

  it 'generates the offset digits from the date of transmission' do
    offset_maker = OffsetMaker.new("040895")
    expect(offset_maker.offset).to eq("1025")
  end

  it 'generates offsets A-D using the offset digits' do
    offset_maker = OffsetMaker.new("040895")
    expect(offset_maker.set_offsets).to eq({"A" => "1",
    "B" => "0", "C" => "2", "D" => "5"})
  end
end
