module Rover
  module Models
    class Activity < Rover::Models::Plan
      field :confirmation_number, type: String
      field :description, type: String
      field :start_time, type: DateTime
      field :end_time, type: DateTime

      def to_props
        super
      end
    end
  end
end
