module Rover
  module Interactions
    module Trip
      class Find < Rover::Interactions::Base
        object :current_user, class: Rover::Models::User
        hash :trip do
          string :id
        end

        def execute
          trip = Rover::Models::Trip.find(inputs[:trip]['id'])

          unless trip
            not_found!(:trip)

            return nil
          end

          unless Rover::Policies::Trip.new(current_user, trip).show?
            not_authorized!

            return nil
          end

          trip
        end
      end
    end
  end
end
