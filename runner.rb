require './lib/decryptor_encryptor'

if ARGV[0].include?('.pgp')
  DecryptorEncryptor.new(ARGV[0]).decrypt
else
  DecryptorEncryptor.new(ARGV[0]).encrypt
end

