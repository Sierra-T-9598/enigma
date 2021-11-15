require 'date'
# require './encryptable.rb'

class Enigma
  # include Encryptable

  def initialize
    @alphabet_array = ("a".."z").to_a << " "
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
        if @alphabet_array.include?(letter)
          shift_letter_index = shift_loop.next
          new_index = @alphabet_array.index(letter) + shift_letter_index
          new_index -= 108 if new_index > 108
          new_index -= 81 if new_index > 81
          new_index -= 54 if new_index > 54
          new_index -= 27 if new_index > 26
          new_letter = @alphabet_array[new_index]
          encrypted_text << new_letter.to_s
        elsif
          encrypted_text << letter.to_s
        end
      end
    #forward_shift(message, key, date)
    encrypted_text
    encrypted[:encryption] = encrypted_text
    encrypted[:key] = @key_maker.key
    encrypted[:date] = @offset_maker.date
    encrypted
  end

  def decrypt(ciphertext, key = nil, date = nil)
    @key_maker = KeyMaker.new(key)
    @offset_maker = OffsetMaker.new(date)
    @shift_finder = ShiftFinder.new(@key_maker.keys, @offset_maker.offsets)
    decrypted = {}

    shifts_array = @shift_finder.shifts.values.map {|value| value.to_i}

    decrypted_text = ""
    ciphertext.to_s
    shift_loop = shifts_array.cycle(ciphertext.length)
      ciphertext.chars.each_with_index do |letter, index|
        if @alphabet_array.include?(letter)
          shift_letter_index = shift_loop.next
          new_index = @alphabet_array.index(letter) - shift_letter_index
          new_index += 108 if new_index < -81
          new_index += 81 if new_index < -54
          new_index += 54 if new_index < -27
          new_index += 27 if new_index < 0
          new_letter = @alphabet_array[new_index]
          decrypted_text << new_letter.to_s
        elsif
          decrypted_text << letter
        end
      end

      decrypted_text
      decrypted[:decryption] = decrypted_text
      decrypted[:key] = key
      decrypted[:date] = @offset_maker.date
      decrypted
      # require "pry"; binding.pry
  end
end
