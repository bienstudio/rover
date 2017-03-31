require 'mongoid'

Mongoid.load!(File.expand_path('../../../config/mongoid.yml', __FILE__))

module Rover
  module Models
  end
end

require_relative 'models/user'
require_relative 'models/trip'
