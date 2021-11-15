# require './key_maker'
# require './offset_maker'

module Encryptable
  def forward_shift(message, key, date)
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
      encrypted_text
      encrypted[:encryption] = encrypted_text
      encrypted[:key] = @key_maker.key
      encrypted[:date] = @offset_maker.date
      encrypted
  end
end
