require 'mongoid'

Mongoid.load!(File.expand_path('../../../config/mongoid.yml', __FILE__))

require_relative 'models/user'
require_relative 'models/trip'
