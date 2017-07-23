module Rover
  module Models
    class Flight < Rover::Models::Plan
      field :confirmation_number, type: String

      embeds_many :segments, class_name: 'Rover::Models::Flight::Segment'
      embeds_many :passengers, class_name: 'Rover::Models::Flight::Passenger'

      class Passenger
        include Mongoid::Document

        field :name, type: String
        field :frequent_flyer_number, type: String
        field :ticket_number, type: String

        embedded_in :flight

        def to_props
          props = self.attributes.clone
          props['id'] = props.delete('_id').to_s
          props['type'] = 'flight'
          props
        end
      end

      class Segment
        include Mongoid::Document

        field :airline, type: String
        field :number, type: String
        field :departure_location, type: String
        field :departure_terminal, type: String
        field :departure_gate, type: String
        field :departure_time, type: DateTime
        field :arrival_location, type: String
        field :arrival_terminal, type: String
        field :arrival_gate, type: String
        field :arrival_time, type: DateTime
        field :seats, type: String

        embedded_in :flight

        alias :start_time :departure_time

        def to_props
          props = self.attributes.clone
          props['id'] = props.delete('_id').to_s
          props['description'] = self.description
          props['type'] = 'flight'
          props
        end

        def description
          "#{airline}#{number} from #{departure_location} to #{arrival_location}"
        end
      end
    end
  end
end
