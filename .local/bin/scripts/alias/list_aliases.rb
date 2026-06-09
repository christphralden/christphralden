require 'yaml'

data = YAML.load_file(ARGV[0])
rows = (data['aliases'] || []) + (data['functions'] || []) + (data['bindkeys'] || [])
rows.sort_by { |a| a['category'] + a['name'] }.each do |a|
  puts [a['category'], a['name'], a['cmd'], a['desc']].join("\t")
end
