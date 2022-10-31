require 'gpgme'

class Decryptor
  attr_accessor :user_provided_file

  def initialize(user_provided_file)
    @user_provided_file = user_provided_file
  end

  def decrypt
    write_to_file(decrypted_string, decrypted_output_file_path)
     puts "#{user_provided_file} was decrypted using private key and saved as #{decrypted_output_file_path}"
  end

  private 

  def decrypted_string
    crypto = GPGME::Crypto.new
    crypto.decrypt file_contents
  end

  def file_contents
    file = File.open(user_provided_file)
    results = file.read
    file.close
    results
  end

  def write_to_file(string, path)
    file = File.new(path, mode: "w")
    file.write(string)
    file.close
  end

  def decrypted_output_file_path
    "#{user_provided_file.concat('_decrypted.txt')}"
  end
  
  def public_key
    GPGME::Key.import(File.open("lib/private.key"))
  end 

  def private_key
    GPGME::Key.import(File.open("lib/private.key"))
  end
end
