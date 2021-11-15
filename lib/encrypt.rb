require_relative './enigma'
require_relative './key_maker.rb'
require_relative './offset_maker.rb'
require_relative './shift_finder.rb'

enigma = Enigma.new

reader = File.open(ARGV[0], "r")
incoming_text = reader.read
reader.close

encrypted_text = enigma.encrypt(incoming_text.chomp)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_text[:encryption])
writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"

###COMMAND LINE:
# ruby encrypt.rb message.txt encrypted.txt
