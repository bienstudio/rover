require_relative 'v1/app'

require_relative '../../lib/rover/extensions'

module Rover
  module API
    module V1
      def self.new
        Rack::Builder.new do
          use Rover::Extensions::ErrorHandler

          Rover::Extensions::Authentication.registered(self)

          run App
        end
      end
    end
  end
end
