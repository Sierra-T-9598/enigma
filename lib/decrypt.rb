require './enigma.rb'

reader = File.open(ARGV[0], "r")
encrypted_text = handle.read
handle.close

### decrypted_text = encrypted_text.METHOD to decrypt
# writer = File.open(ARGV[1], "w")
# writer.write(decrypted_text)
# writer.close

puts "Created #{ARGV[1]} with the key #{key} and date #{date}"

###COMMAND LINE:
# ruby decrypt.rb encrypted.txt decrypted.txt key date
