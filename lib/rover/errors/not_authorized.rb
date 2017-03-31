module Rover
  module Errors
    class NotAuthorized < InvalidRequest
      def initialize
        super(status: 403, message: 'not authorized')
      end
    end
  end
end
