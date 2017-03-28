require_relative 'v1/app'

module Rover
  module API
    module V1
      def self.new
        Rack::Builder.new do
          run App
        end
      end
    end
  end
end
