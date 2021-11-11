require './enigma.rb'

reader = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

### encrypted_text = incoming_text.METHOD
# writer = File.open(ARGV[1], "w")
# writer.write(encrypted_text)
# writer.close

puts "Created #{ARGV[1]} with the key #{key} and date #{date}"

###COMMAND LINE:
# ruby encrypt.rb message.txt encrypted.txt
