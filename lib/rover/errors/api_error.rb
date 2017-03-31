module Rover
  module Errors
    class APIError < Error
      def initialize(params = {})
        super({
          status: 500,
          type: :api_error,
          message: 'api error'
        }.merge!(params))
      end
    end
  end
end
