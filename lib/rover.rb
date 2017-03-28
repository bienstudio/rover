require_relative 'rover/helpers'
require_relative 'rover/models'

require_relative '../apps/api/v1'

module Rover
  def self.apps
    Rack::URLMap.new(
      '/api/v1' => Rover::API::V1.new
    )
  end
end
