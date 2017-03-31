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

          not_authorized! unless Rover::Policies::User.new(current_user, user).show?
          not_found!(:user) unless user

          user
        end
      end
    end
  end
end
