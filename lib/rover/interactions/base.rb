module Rover
  module Interactions
    class Base < ActiveInteraction::Base

      # Override #run! to have better error handling. Instead of raising
      #   ActiveInteraction::InvalidInteractionError, raise our own invalid
      #   request error with more in-depth details.
      def run!(*args)
        run

        unless valid?
          raise Rover::Errors::InvalidRequest.new(message: errors.details)
        end

        result
      end
    end
  end
end
