module Rover
  module Interactions
    module User
      class Find < Rover::Interactions::Base
        object :current_user, class: Rover::Models::User
        hash :user do
          string :id
        end

        def execute
          user = Rover::Models::User.find(inputs[:user]['id'])

          unless user
            not_found!(:user)
            return nil
          end

          unless Rover::Policies::User.new(current_user, user).show?
            not_authorized!
            return nil
          end

          user
        end
      end
    end
  end
end
