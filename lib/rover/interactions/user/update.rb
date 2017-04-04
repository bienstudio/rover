module Rover
  module Interactions
    module User
      class Update < Base
        object :current_user, class: Rover::Models::User
        object :record, class: Rover::Models::User
        hash :user do
          string :email, default: nil
          string :password, default: nil
        end

        def execute
          not_authorized! unless Rover::Policies::User.new(current_user, record).update?

          record.email    = user['email']     if user['email']
          record.password = user['password']  if user['password']

          unless record.save
            merge_errors!(record)
          end

          record
        end
      end
    end
  end
end
