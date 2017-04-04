module Rover
  module Interactions
    module User
      class Destroy < Base
        object :current_user, class: Rover::Models::User
        object :record, class: Rover::Models::User

        def execute
          not_authorized! unless Rover::Policies::User.new(current_user, record).destroy?

          record.destroy

          record
        end
      end
    end
  end
end
