module Rover
  module Interactions
    module Plan
      class Create < Rover::Interactions::Base
        object :current_user, class: Rover::Models::User
        object :trip, class: Rover::Models::Trip
        hash :plan do
          date :booking_date, default: nil
          string :booking_reference, default: nil
          float :booking_rate, default: nil
          float :total_cost, default: nil
          boolean :purchased, default: false
          string :note, default: nil
        end
      end
    end
  end
end
