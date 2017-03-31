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

      def not_authorized!
        errors.add(:current_user, 'not authorized')
      end

      def not_found!(key)
        errors.add(key, 'not allowed')
      end

      def merge_errors!(record)
        errors.details.merge!(record.errors.details)
        errors.messages.merge!(record.errors.messages)
      end
    end
  end
end
