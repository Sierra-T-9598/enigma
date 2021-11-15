require './spec_helper.rb'
require 'date'
require './lib/key_maker.rb'
require './lib/offset_maker.rb'
require './lib/shift_finder.rb'
require './lib/enigma.rb'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message with a key and date' do
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it 'can encrypt using the date from today' do
    expect(@enigma.encrypt("hello world", "02715")).to be_a(Hash)
    expect(@enigma.encrypt("hello world", "02715").count).to eq(3)
  end

  it 'can decrypt using the date from today' do
    encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to be_a(Hash)
  end

  it 'can generate random keys and use the date from today' do
    expect(@enigma.encrypt("hello world")).to be_a(Hash)
    expect(@enigma.encrypt("hello world").count).to eq(3)
  end


### Edge Case Testing

  it 'only translates messages in lowercase' do
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    expect(@enigma.encrypt("Hello worlD", "02715", "040895")).to eq(expected)
  end

  it 'can encrypt a message with other characters that stay the same' do
    expected = {encryption: "keder ohulw!",
                key: "02715",
                date: "040895"}
    expect(@enigma.encrypt("hello world!", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message with other characters that stay the same' do
    expected = {decryption: "hello world!",
                key: "02715",
                date: "040895"}
    expect(@enigma.decrypt("keder ohulw!", "02715", "040895")).to eq(expected)
  end

  ### Shiftable Module Unit Testing

  it 'can shift the message forward to encrypt' do
    expect(@enigma.shift_message("hello world", [3, 27, 73, 20])).to eq("keder ohulw")
  end

  it 'can shift the ciphertext backward to decrypt' do
    expect(@enigma.shift_ciphertext("keder ohulw", [3, 27, 73, 20])).to eq("hello world")
  end
end
