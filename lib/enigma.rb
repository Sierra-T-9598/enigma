require './shift_finder.rb'
require 'date'
class Enigma
  def initialize
    @alphabet_array = ("a".."z").to_a << " "
    # @date = Date.today.strftime("%m%d%y")
    # @key_maker = KeyMaker.new(key = nil)
    # super(keys, offsets)
  end

  def encrypt(message, key = nil, date = nil)
    @key_maker = KeyMaker.new(key)
    @offset_maker = OffsetMaker.new(date)
    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
    encrypted = {}

    shifts_array = @shift_finder.shifts.values.map {|value| value.to_i}

    encrypted_text = ""
    message.downcase!
    shift_loop = shifts_array.cycle(message.length)
      message.chars.each_with_index do |letter, index|
        shift_letter_index = shift_loop.next
        new_index = @alphabet_array.index(letter) + shift_letter_index
        new_index -= 54 if new_index > 54
        new_index -= 27 if new_index > 26
        new_letter = @alphabet_array[new_index]
        encrypted_text << new_letter.to_s
      end
      encrypted_text
      encrypted[:encryption] = encrypted_text
      encrypted[:key] = key
      encrypted[:date] = date
      encrypted
  end

  def decrypt(ciphertext, key = nil, date = nil)
    @key_maker = KeyMaker.new(key)
    @offset_maker = OffsetMaker.new(date)
    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
    encrypted = {}

    shifts_array = @shift_finder.shifts.values.map {|value| value.to_i}

    encrypted_text = ""
    ciphertext.downcase!
    shift_loop = shifts_array.cycle(ciphertext.length)
      ciphertext.chars.each_with_index do |letter, index|
        shift_letter_index = shift_loop.next
        new_index = @alphabet_array.reverse.index(letter) + shift_letter_index
        new_index -= 54 if new_index > 54
        new_index -= 27 if new_index > 26
        new_letter = @alphabet_array.reverse[new_index]
        encrypted_text << new_letter.to_s
      end
      encrypted_text
      encrypted[:decryption] = encrypted_text
      encrypted[:key] = key
      encrypted[:date] = date
      encrypted
      # require "pry"; binding.pry
  end
end
