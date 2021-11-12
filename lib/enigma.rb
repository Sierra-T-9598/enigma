require './shift_finder.rb'
require 'date'
class Enigma
  def initialize
    @indexed_character_set = ("a".."z").to_a << " "
    # @date = Date.today.strftime("%m%d%y")
    # @key_maker = KeyMaker.new(key = nil)
    # super(keys, offsets)
  end

  def encrypt(message, key = nil, date = nil)
    @key_maker = KeyMaker.new(key)
    @offset_maker = OffsetMaker.new(date)
    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
    require "pry"; binding.pry
    # require "pry"; binding.pry
  end

  def decrypt(ciphertext, key, date)
  end
end
