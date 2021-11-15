module Shiftable
  def shift_message(message, shifts_array)
    alphabet_array = ("a".."z").to_a << " "
    encrypted_text = ""
    message.downcase!
    shift_loop = shifts_array.cycle(message.length)
      message.chars.each do |letter|
        if alphabet_array.include?(letter)
          shift_letter_amount = shift_loop.next
          new_index = alphabet_array.index(letter) + shift_letter_amount
          new_index -= 108 if new_index > 108
          new_index -= 81 if new_index > 81
          new_index -= 54 if new_index > 54
          new_index -= 27 if new_index > 26
          new_letter = alphabet_array[new_index]
          encrypted_text << new_letter.to_s
        elsif
          encrypted_text << letter.to_s
        end
      end
      encrypted_text
  end


  def shift_ciphertext(ciphertext, shifts_array)
    alphabet_array = ("a".."z").to_a << " "
    decrypted_text = ""
    ciphertext.to_s
    shift_loop = shifts_array.cycle(ciphertext.length)
      ciphertext.chars.each do |letter|
        if alphabet_array.include?(letter)
          shift_letter_amount = shift_loop.next
          new_index = alphabet_array.index(letter) - shift_letter_amount
          new_index += 108 if new_index < -81
          new_index += 81 if new_index < -54
          new_index += 54 if new_index < -27
          new_index += 27 if new_index < 0
          new_letter = alphabet_array[new_index]
          decrypted_text << new_letter.to_s
        elsif
          decrypted_text << letter
        end
      end
      decrypted_text
  end
end
