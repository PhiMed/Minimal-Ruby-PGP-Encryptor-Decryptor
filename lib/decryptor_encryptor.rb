require 'gpgme'
require './application.rb'

class DecryptorEncryptor
  attr_accessor :user_provided_file, :output_file_type

  PRIVATE_KEY_PATH = ENV['private_key_path']
  PUBLIC_KEY_PATH = ENV['public_key_path']

  def initialize(user_provided_file, output_file_type)
    @user_provided_file = user_provided_file
    @output_file_type = output_file_type ? output_file_type : '.txt'
  end

  def decrypt
    write_to_file(decrypted_string, decrypted_output_file_path)
     puts "#{user_provided_file} was decrypted using private key and saved as #{decrypted_output_file_path}"
  end

  def encrypt
    write_to_file(encrypted_string, encrypted_output_file_path)
    puts "#{user_provided_file} was encrypted using public key and saved as #{encrypted_output_file_path}."
  end

  private 

  def decrypted_string
    private_key
    crypto = GPGME::Crypto.new
    crypto.decrypt(file_contents)
  end

  def encrypted_string
    public_key
    crypto = GPGME::Crypto.new
    crypto.encrypt(file_contents, :always_trust => true)
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
    "#{user_provided_file.chomp('.pgp') + output_file_type}"
  end

  def encrypted_output_file_path
    user_provided_file.gsub(File.extname(user_provided_file), ".pgp")
  end
  
  def private_key
    GPGME::Key.import(File.open("#{PRIVATE_KEY_PATH}"))
  end

  def public_key
    GPGME::Key.import(File.open("#{PUBLIC_KEY_PATH}"))
  end
end
