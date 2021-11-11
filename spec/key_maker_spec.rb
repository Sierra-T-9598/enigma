require './spec_helper.rb'
require './lib/key_maker.rb'

RSpec.describe KeyMaker do

  it 'exists' do
    key_maker = KeyMaker.new("02715")
    expect(key_maker).to be_instance_of(KeyMaker)
  end

  it 'has attributes' do
    key_maker = KeyMaker.new("02715")
    expect(key_maker.key).to eq("02715")
  end

  it 'can randomly generate a 5-digit key to use' do
    key_maker_random = KeyMaker.new
    key_maker_random.key
    expect(key_maker_random.key).to be_instance_of(String)
    expect(key_maker_random.key.length).to be(5)
  end
end
