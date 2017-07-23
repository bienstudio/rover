require 'pry'

describe Rover::Interactions::Plan::Flight::Create do
  subject { Rover::Interactions::Plan::Flight::Create }

  let(:trip) { create(:trip) }

  describe '#execute' do
    let(:action) do
      subject.run(
        current_user: trip.user,
        trip: trip,
        plan: { },
        flight: {
          confirmation_number: '1234567890',
          segments: [
            {
              airline: 'DLT',
              number: '123',
              departure_location: 'BDL',
              departure_terminal: 'A',
              departure_gate: '12',
              departure_time: DateTime.now,
              arrival_location: 'MCO',
              arrival_terminal: '4',
              arrival_gate: '4',
              arrival_time: DateTime.now + 6.hours,
              seats: '12'
            }
          ],
          passengers: [
            {
              name: 'Mickey Mouse',
              frequent_flyer_number: '123',
              ticket_number: '123'
            }
          ]
        }
      )
    end

    it 'results in a Flight' do
      expect(action.result).to be_a Rover::Models::Flight
    end

    it 'results in a Flight that has Segments' do
      expect(action.result.segments.size).to eql 1
      expect(action.result.segments.first.airline).to eql 'DLT'
    end

    it 'results in a Flight that has Passengers' do
      expect(action.result.passengers.size).to eql 1
      expect(action.result.passengers.first.name).to eql 'Mickey Mouse'
    end
  end
end
