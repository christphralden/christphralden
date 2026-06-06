require 'yaml'
require 'shellwords'

data = YAML.load_file(ARGV[0])
(data['aliases'] || []).each do |a|
  puts "alias -- #{Shellwords.shellescape(a['name'])}=#{Shellwords.shellescape(a['cmd'])}"
end
