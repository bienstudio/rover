module Rover
  module Errors
    class InvalidRequest < Error
      def initialize(params = {})
        super({
          status: 400,
          type: :invalid_request
        }.merge!(params))
      end
    end
  end
end
