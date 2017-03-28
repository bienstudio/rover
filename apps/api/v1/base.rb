module Rover
  module API
    module V1
      class Base < Sinatra::Base
        register Sinatra::Namespace

        helpers Rover::Helpers::Response

        before do
          content_type :json
        end
      end
    end
  end
end
