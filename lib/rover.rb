require_relative 'rover/errors'
require_relative 'rover/policies'
require_relative 'rover/models'
require_relative 'rover/extensions'
require_relative 'rover/helpers'
require_relative 'rover/interactions'

require_relative '../apps/api/v1'
require_relative '../apps/web'

module Rover
  def self.apps
    Rack::URLMap.new(
      '/api/v1' => Rover::API::V1.new,
      '/' => Rover::Web.new
    )
  end
end
