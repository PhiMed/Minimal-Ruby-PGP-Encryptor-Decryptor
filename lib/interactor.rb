class Interactor
  INVALID_ARGS_MESSAGE = "Invalid arguments. To decrypt or encrypt a file, run '$ruby runner.rb <file_path> -encrypt' or
  '$ruby runner.rb <file_path> -decrypt', depending on the action you want taken."

  def initialize(file = nil, action = nil, output_file_type)
    return puts INVALID_ARGS_MESSAGE unless ARGV[0] && action

    if file.include?('.pgp') && action == :encrypt
      puts "Encryption failed. File is already an encrypted .pgp file."
    elsif !file.include?('.pgp') && action == :decrypt
      puts "Decryption failed. File is not a .pgp file."
    else
      begin
        DecryptorEncryptor.new(file, output_file_type).send(action)
      rescue GPGME::Error::NoData
        puts "Decryption failed. Check file and key"
      rescue Errno::ENOENT
        puts "Couldn't find a file at #{file}"
      end
    end
  end
end
