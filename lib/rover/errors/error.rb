module Rover
  module Errors
    class Error < StandardError
      attr_reader :status, :type, :message

      def initialize(attributes)
        @status = attributes[:status]
        @type = attributes[:type]
        @message = attributes[:message]
      end
    end
  end
end
