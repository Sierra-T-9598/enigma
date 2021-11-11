require './lib/key_maker.rb'

RSpec.describe KeyMaker do
  before(:each) do
    @key_maker = KeyMaker.new
  end

  it 'exists' do
    expect(@key_maker).to be_instance_of(KeyMaker)
  end 
end
