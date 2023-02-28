require './lib/decryptor_encryptor'
require './lib/interactor'

puts "Do you wish to decrypt or encrypt? Type 'D' or 'E'"

action_input = gets.chomp

case action_input
when 'E'
  action = :encrypt
when 'D'
  action = :decrypt
end

puts "What is the location of the file you'd like to #{action.to_s}" if action

file_path = gets.chomp

if action == :decrypt
  puts "What file extension would you like the decrypted file to have? (eg '.txt') Press enter to skip and save without extension"
  output_file_type = gets.chomp
end

file_path = file_path.to_s.empty? ? nil : file_path
output_file_type = output_file_type.to_s.empty? ? nil : output_file_type

Interactor.new(file_path, action, output_file_type)
