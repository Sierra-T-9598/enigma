require 'date'
require_relative './shiftable.rb'

class Enigma
  include Shiftable

  # def initialize
  #  # @alphabet_array = ("a".."z").to_a << " "
  # end

  def encrypt(message, key = nil, date = nil)
    @key_maker = KeyMaker.new(key)
    @offset_maker = OffsetMaker.new(date)
    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
    shifts_array = @shift_finder.shifts.values.map {|value| value.to_i}
    encrypted = {}
    encrypted[:encryption] = shift_message(message, shifts_array)
    encrypted[:key] = @key_maker.key
    encrypted[:date] = @offset_maker.date
    encrypted
  end

  def decrypt(ciphertext, key = nil, date = nil)
    @key_maker = KeyMaker.new(key)
    @offset_maker = OffsetMaker.new(date)
    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
    shifts_array = @shift_finder.shifts.values.map {|value| value.to_i}
    decrypted = {}
    decrypted[:decryption] = shift_ciphertext(ciphertext, shifts_array)
    decrypted[:key] = key
    decrypted[:date] = @offset_maker.date
    decrypted
  end
end
