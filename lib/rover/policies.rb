require 'pundit'

module Rover
  module Policies
  end
end

require_relative 'policies/base'
require_relative 'policies/user_policy'
require_relative 'policies/trip_policy'
