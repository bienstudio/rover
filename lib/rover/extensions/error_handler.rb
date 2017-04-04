require 'pry'

module Rover
  module Extensions
    class ErrorHandler
      CONTENT_TYPE = { 'Content-Type' => 'application/json' }.freeze

      def initialize(app)
        @app = app
      end

      def handle_error(e)
        error =
          case e
          when Mongoid::Errors::Validations
            Rover::Errors::InvalidRequest.new(message: e.document.errors.details)
          when ActiveInteraction::InvalidInteractionError
            Rover::Errors::InvalidRequest.new(message: e.message)
          when JSON::ParserError
            Rover::Errors::InvalidRequest.new(message: 'Problem parsing JSON')
          when Mongoid::Errors::DocumentNotFound
            Rover::Errors::NotFound.new
          when Sinatra::NotFound
            Rover::Errors::NotFound.new
          when Rover::Errors::Error
            e
          else
            Rover::Errors::APIError.new(message: e.message)
          end

        [error.status, CONTENT_TYPE, [Rabl.render(error, 'error')]]
      end

      def call(env)
        response = @app.call(env)
        raise env['sinatra.error'] if env['sinatra.error']
        response
      rescue => e
        handle_error(e)
      end
    end
  end
end
