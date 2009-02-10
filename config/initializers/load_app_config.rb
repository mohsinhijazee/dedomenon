
# Load app config

# Include your application configuration below
require 'yaml'
require 'json'
CONFIG = YAML::load(File.open("#{RAILS_ROOT}/config/environments/app-config-#{RAILS_ENV}.yml"))
