module Rover
  module Interactions
    module Trip
      class Destroy < Base
        object :current_user, class: Rover::Models::User
        object :record, class: Rover::Models::Trip

        def execute
          not_authorized! unless Rover::Policies::Trip.new(current_user, record).destroy?

          record.destroy

          record
        end
      end
    end
  end
end
