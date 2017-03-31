module Rover
  module Interactions
    module User
      class Find < Rover::Interactions::Base
        hash :user do
          string :id
        end

        def execute
          user = Rover::Models::User.find(inputs[:user]['id'])

          fail Rover::Errors::NotFound unless user

          user
        end
      end
    end
  end
end
