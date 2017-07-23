module Rover
  module Interactions
    module Plan
      module Flight
        class Create < Rover::Interactions::Base
          import_filters Rover::Interactions::Plan::Create

          hash :flight do
            with_options default: nil do
              string :confirmation_number
              array :segments do
                hash do
                  string :airline
                  string :number
                  string :departure_location
                  string :departure_terminal
                  string :departure_gate
                  date_time :departure_time
                  string :arrival_location
                  string :arrival_terminal
                  string :arrival_gate
                  date_time :arrival_time
                  string :seats
                end
              end
              array :passengers do
                hash do
                  string :name
                  string :frequent_flyer_number
                  string :ticket_number
                end
              end
            end
          end

          def execute
            _flight = Rover::Models::Flight.new(flight.except(:segments, :passengers))

            flight['segments'].each do |segment|
              _flight.segments << Rover::Models::Flight::Segment.new(segment)
            end

            flight['passengers'].each do |passenger|
              _flight.passengers << Rover::Models::Flight::Passenger.new(passenger)
            end

            _flight.save

            _flight
          end
        end
      end
    end
  end
end
