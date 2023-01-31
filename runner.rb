require './lib/decryptor_encryptor'
require './lib/interactor'
require 'optparse'

action = nil
output_file_type = nil

OptionParser.new do |opts|
  opts.on('-decrypt') { |a| action = :decrypt }
  opts.on('-encrypt') { |a| action = :encrypt }
  opts.on('-csv') { |a| output_file_type = '.csv' }
end.parse!

Interactor.new(ARGV[0], action, output_file_type)
