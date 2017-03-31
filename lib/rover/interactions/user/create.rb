module Rover
  module Interactions
    module User
      class Create < Rover::Interactions::Base
        hash :user do
          string :email
          string :password
        end

        def to_model
          Rover::Models::User.new
        end

        def execute
          user = Rover::Models::User.new(inputs[:user])

          unless user.save
            merge_errors!(user)
          end

          user
        end
      end
    end
  end
end
