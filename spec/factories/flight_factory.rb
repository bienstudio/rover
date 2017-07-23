FactoryGirl.define do
  factory :flight, class: Rover::Models::Flight do
    trip

    after(:build) do |flight, evaluator|
      flight.segments << build(:flight_segment)
      flight.passengers << build(:flight_passenger)
    end
  end

  factory :flight_segment, class: Rover::Models::Flight::Segment do
    airline 'DY'
    number '7016'
    departure_location 'JFK'
    departure_time { DateTime.now }
    arrival_location 'LGW'
    arrival_time { DateTime.now + 7.hours }
  end

  factory :flight_passenger, class: Rover::Models::Flight::Passenger do
    name 'Bill Nye'
  end
end
