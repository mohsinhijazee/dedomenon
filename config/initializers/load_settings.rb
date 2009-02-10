
print File.basename(__FILE__) + "\n"
require 'ostruct'

config = OpenStruct.new(YAML.load_file("#{RAILS_ROOT}/config/settings.yml"))
env_config = config.send(RAILS_ENV)
config.common.update(env_config) unless env_config.nil?
::AppConfig = OpenStruct.new(config.common)
