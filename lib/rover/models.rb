require 'mongoid'

Mongoid.load!(File.expand_path('../../../config/mongoid.yml', __FILE__))

module Rover
  module Models
  end
end

require_relative 'models/user'
require_relative 'models/trip'
require_relative 'models/plan'
require_relative 'models/plans/activity'
require_relative 'models/plans/flight'
