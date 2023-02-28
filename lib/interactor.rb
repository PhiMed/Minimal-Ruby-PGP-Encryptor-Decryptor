class Interactor
  INVALID_ARGS_MESSAGE = "Something went wrong. Follow the prompts and try again"

  def initialize(file_path, action, output_file_type)
    return puts INVALID_ARGS_MESSAGE unless file_path && action

    if file_path.include?('.pgp') && action == :encrypt
      puts "Encryption failed. File is already an encrypted .pgp file."
    elsif !file_path.include?('.pgp') && action == :decrypt
      puts "Decryption failed. File is not a .pgp file."
    else
      begin
        DecryptorEncryptor.new(file_path, output_file_type).send(action)
      rescue GPGME::Error::NoData
        puts "Decryption failed. Check file and key"
      rescue Errno::ENOENT
        puts "Couldn't find a file at #{file_path}"
      end
    end
  end
end
