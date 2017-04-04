module Rover
  module Interactions
    class Base < ActiveInteraction::Base

      # Override #run! to have better error handling. Instead of raising
      #   ActiveInteraction::InvalidInteractionError, raise our own invalid
      #   request error with more in-depth details.
      def run!(*args)
        run

        unless valid?
          if errors.messages[:current_user].include? 'not authorized'
            raise Rover::Errors::NotAuthorized.new
          else
            raise Rover::Errors::InvalidRequest.new(message: errors.details)
          end
        end

        result
      end

      def not_authorized!
        errors.add(:current_user, 'not authorized')
        return nil
      end

      def not_found!(key)
        errors.add(key, 'not allowed')
        return nil
      end

      def merge_errors!(record)
        errors.details.merge!(record.errors.details)
        errors.messages.merge!(record.errors.messages)
      end
    end
  end
end
