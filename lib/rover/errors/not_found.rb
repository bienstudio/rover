module Rover
  module Errors
    class NotFound < InvalidRequest
      def initialize
        super(status: 404, message: 'not found')
      end
    end
  end
end
