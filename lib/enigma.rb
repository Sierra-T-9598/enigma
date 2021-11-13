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
    # loop do
      message.chars.each_with_index do |letter, index|
        shift_letter_index = shift_loop.next
        new_index = @alphabet_array.index(letter) + shift_letter_index
        new_index -= 54 if new_index > 54
        new_index -= 27 if new_index > 26
        new_letter = @alphabet_array[new_index]
        encrypted_text << new_letter.to_s
        # shift_letter_index = shift_loop.rotate
        # if encrypted_text.length == message.length
        #   break
        # end
      end

      encrypted_text
      require "pry"; binding.pry
    end


    # encrypted[:key] = key
    # encrypted[:date] = date
    # require "pry"; binding.pry

  def decrypt(ciphertext, key, date)
  end
end
