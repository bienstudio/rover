module Rover
  module Interactions
    module Trip
      class Create < Rover::Interactions::Base
        object :current_user, class: Rover::Models::User
        hash :trip do
          string :name
          date :start_date, default: nil
          date :end_date, default: nil
        end

        def to_model
          Rover::Models::Trip.new
        end

        def execute
          trip = Rover::Models::Trip.new(inputs[:trip])
          trip.user = current_user

          unless trip.save
            merge_errors!(user)
          end

          trip
        end
      end
    end
  end
end
