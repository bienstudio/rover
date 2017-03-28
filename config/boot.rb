ENV['RACK_ENV'] ||= 'development'

unless ENV['RACK_ENV'] == 'production'
  require 'dotenv'

  Dotenv.load
end

require 'rabl'

Rabl.configure do |config|
  config.view_paths = ['apps/api/v1/views']
  config.include_json_root = false
  config.include_child_root = false
end

require_relative '../lib/rover'
