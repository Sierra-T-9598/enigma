require_relative './enigma.rb'
require_relative './key_maker.rb'
require_relative './offset_maker.rb'
require_relative './shift_finder.rb'

enigma = Enigma.new

reader = File.open(ARGV[0], "r")
encrypted_text = reader.read
reader.close

decrypted_text = enigma.decrypt(encrypted_text.chomp, ARGV[2], ARGV[3] = nil)

writer = File.open(ARGV[1], "w")
writer.write(decrypted_text[:decryption])
writer.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"

###COMMAND LINE:
# ruby decrypt.rb encrypted.txt decrypted.txt key date
